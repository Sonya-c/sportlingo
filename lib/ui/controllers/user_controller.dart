import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../data/model/user.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';

class UserController extends GetxController with UiLoggy {
  final databaseRef = FirebaseDatabase.instance.ref();
  final AuthController authController = Get.find();

  // Observable properties
  final Rx<User> _currentUser = User(
    key: '',
    name: '',
    username: '',
    email: '',
    uid: '',
    timeGoal: 0,
    distanceGoal: 0,
    activities: [],
    chats: [],
  ).obs;

  final distance = 0.0.obs;
  final time = const Duration().obs;

  User get currentUser => _currentUser.value;

  double get currentDistance => distance.value;
  double get currentGoalDistance => _currentUser.value.distanceGoal.toDouble();

  Duration get currentTime => time.value;
  Duration get currentGoalTime =>
      Duration(minutes: _currentUser.value.timeGoal);

  List<Activity> get currentActivities => _currentUser.value.activities;

  @override
  void onInit() {
    loggy.info("Initializing...");
    _loadCurrentUser();
    ever(authController.logged, (logged) => _loadCurrentUser());
    super.onInit();
  }

  void _loadCurrentUser() {
    String uid = authController.getUid();
    if (uid.isNotEmpty) {
      databaseRef
          .child("users")
          .child(uid)
          .onValue
          .listen((DatabaseEvent event) {
        final json = event.snapshot.value as Map<dynamic, dynamic>?;
        if (json != null) {
          _currentUser.value = User.fromJson(event.snapshot, json);
        }
      });
    }
  }

  Future<void> registerActivity(double distance, Duration time) async {
    // Update local state
    this.distance.value += distance;
    this.time.value += time;

    DateTime currentDate = DateTime.now(); // Get the current date
    _currentUser.update((user) {
      user?.activities
          .add(Activity(distance: distance, time: time, date: currentDate));
    });

    // Update Firebase
    await _updateUserActivities();
  }

  Future<void> changeGoals(double goalDistance, Duration goalTime) async {
    // Update local state
    _currentUser.update((user) {
      user?.distanceGoal = goalDistance;
      user?.timeGoal = goalTime.inMinutes;
    });

    // Update Firebase
    await _updateUserGoals();
  }

  Future<void> createUser(
      String name, String username, String email, String uid) async {
    try {
      User newUser = User(
        name: name,
        username: username,
        email: email,
        uid: uid,
        timeGoal: 0,
        distanceGoal: 0,
        activities: [],
        chats: [],
      );

      Map<String, dynamic> userJson = newUser.toJson();
      loggy.info("Uploading user data: $userJson");

      await databaseRef.child('users').child(uid).set(userJson);
      _currentUser.value = newUser;
    } catch (error) {
      logError("Error creating user: $error");
      return Future.error("Error creating user: $error");
    }
  }

  Future<void> _updateUserActivities() async {
    // Convert activities to a format suitable for Firebase
    List<Map<String, dynamic>> activitiesData = _currentUser.value.activities
        .map((activity) {
          return activity.toJson();
        })
        .toList()
        .cast<Map<String, dynamic>>();

    await databaseRef
        .child("users")
        .child(_currentUser.value.uid)
        .child("activities")
        .set(activitiesData);
  }

  Future<void> _updateUserGoals() async {
    await databaseRef.child("users").child(_currentUser.value.uid).update({
      "distanceGoal": _currentUser.value.distanceGoal,
      "timeGoal": _currentUser.value.timeGoal,
    });
  }
}

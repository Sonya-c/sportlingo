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

  User get currentUser => _currentUser.value;

  UserController() {
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    String uid = authController.getUid();
    if (uid.isNotEmpty) {
      databaseRef.child("users").child(uid).onValue.listen((DatabaseEvent event) {
        final json = event.snapshot.value as Map<dynamic, dynamic>?;
        if (json != null) {
          _currentUser.value = User.fromJson(event.snapshot, json);
        }
      });
    }
  }

  double get currentDistance => _currentUser.value.distanceGoal.toDouble();
  double get currentGoalDistance => _currentUser.value.distanceGoal.toDouble();
  Duration get currentTime => Duration(minutes: _currentUser.value.timeGoal);
  Duration get currentGoalTime => Duration(minutes: _currentUser.value.timeGoal);
  List<Activity> get currentActivities => _currentUser.value.activities;

  void registerActivity(double distance, Duration time) {
    // Update local state
    DateTime currentDate = DateTime.now(); // Get the current date
    _currentUser.update((user) {
      user?.activities.add(Activity(distance: distance, time: time, date: currentDate));
    });

    // Update Firebase
    _updateUserActivities();
  }

  void changeGoals(double goalDistance, Duration goalTime) {
    // Update local state
    _currentUser.update((user) {
      user?.distanceGoal = goalDistance.toInt();
      user?.timeGoal = goalTime.inMinutes;
    });

    // Update Firebase
    _updateUserGoals();
  }

  Future<void> createUser(String name, String username, String email, String uid) async {
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

      await databaseRef.child('users').child(uid).set(newUser.toJson());
      _currentUser.value = newUser;
    } catch (error) {
      logError("Error creating user: $error");
      return Future.error("Error creating user: $error");
    }
  }

  void _updateUserActivities() {
    // Convert activities to a format suitable for Firebase
    List<Map<String, dynamic>> activitiesData = _currentUser.value.activities.map((activity) {
      return activity.toJson();
    }).toList().cast<Map<String, dynamic>>();


    databaseRef.child("users").child(_currentUser.value.uid).child("activities").set(activitiesData);
  }

  void _updateUserGoals() {
    databaseRef.child("users").child(_currentUser.value.uid).update({
      "distanceGoal": _currentUser.value.distanceGoal,
      "timeGoal": _currentUser.value.timeGoal,
    });
  }
}

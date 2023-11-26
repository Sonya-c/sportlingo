import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../data/model/user.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';

enum ActivityStatus { running, paused, finished, nonstarted }

class ActivityController extends GetxController with UiLoggy {
  final UserController userController = Get.find();
  final databaseRef = FirebaseDatabase.instance.ref();

  final Rx<Activity> currentActivity = Activity(
    date: DateTime.now(),
    time: Duration(),
    distance: 0.0,
  ).obs;
  final status = ActivityStatus.nonstarted.obs;

  void startActivity() {
    currentActivity.value = Activity(
      date: DateTime.now(),
      time: Duration(),
      distance: 0.0,
    );
    status.value = ActivityStatus.running;
  }

  void pauseActivity() {
    if (status.value == ActivityStatus.running) {
      status.value = ActivityStatus.paused;
      // Pause the timer or any other logic
    }
  }

  void stopActivity() {
    if (status.value == ActivityStatus.running || status.value == ActivityStatus.paused) {
      status.value = ActivityStatus.finished;
      // Stop the timer and finalize the activity
      _saveActivityToFirebase();
    }
  }

  void _saveActivityToFirebase() {
    String uid = userController.currentUser.uid;
    if (uid.isNotEmpty) {
      // Convert the current activity to a JSON map
      Map<String, dynamic> activityData = currentActivity.value.toJson();

      // Add the new activity to the user's activities list in Firebase
      databaseRef.child('users').child(uid).child('activities').push().set(activityData);
    }
  }
}

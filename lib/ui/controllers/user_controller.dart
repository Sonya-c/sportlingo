import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UserController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting a user...");
  }

  final RxDouble distance = 2.0.obs;
  final RxDouble goalDistance = 2.0.obs;
  final Rx<Duration> time = const Duration(minutes: 25).obs;
  final Rx<Duration> goalTime = const Duration(minutes: 25).obs;
  final RxList activities = [
    {
      "distance": 0.1,
      "time": const Duration(minutes: 5),
    },
    {
      "distance": 0.2,
      "time": const Duration(minutes: 10),
    },
    {
      "distance": 1.0,
      "time": const Duration(minutes: 10),
    },
  ].obs;

  double get currentDistance => distance.value;
  double get currentGoalDistance => goalDistance.value;
  Duration get currentTime => time.value;
  Duration get currentGoalTime => goalTime.value;
  List get currentActivities => activities;

  UserController() {
    // get current distance from use case
    // get current time from use case
  }

  registerActivity(double distance, Duration time) {
    // call use case
    this.distance.value += distance;
    this.time.value += time;
    // return: current distance, current time
  }

  changeGoals(double goalDistance, Duration goalTime) {
    // call use case
    this.goalDistance.value = goalDistance;
    this.goalTime.value = goalTime;
    // return: current goal distance, current goal time
  }
}

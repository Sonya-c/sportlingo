import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

enum ActivityStatus { running, paused, finished, nonstarted }

class ActivityController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting a user...");
  }

  final RxDouble distance = 10.0.obs;
  final Rx<Duration> time = const Duration(minutes: 10).obs;
  final Rx<ActivityStatus> status = ActivityStatus.nonstarted.obs;

  double get currentDistance => distance.value;
  Duration get currentTime => time.value;

  Future<void> starActivity() async {
    loggy.info("Starting an activity...");
    status.value = ActivityStatus.running;
  }

  Future<void> newActivity() async {
    loggy.info("Starting a new activity...");
    status.value = ActivityStatus.nonstarted;
  }

  Future<void> pauseActivity() async {
    loggy.info("Pausing an activity...");
    status.value = ActivityStatus.paused;
  }

  Future<void> resumeActivity() async {
    loggy.info("Pausing an activity...");
    status.value = ActivityStatus.running;
  }

  Future<void> stopActivity() async {
    loggy.info("Stopping an activity...");
    status.value = ActivityStatus.finished;
  }
}

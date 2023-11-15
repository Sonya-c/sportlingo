import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

enum ActivityStatus { running, paused, finished, nonstarted }

class ActivityController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting a user...");
  }

  final distance = 0.obs;
  final time = const Duration().obs;
  final status = ActivityStatus.nonstarted.obs;

  starActivity() {}

  pauseActivity() {}

  stopActivity() {}
}

import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UserController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting a user...");
  }

  final distance = 1.3.obs;
  UserController() {
    // get current distance from use case
    // get current time from use case
  }

  registerActivity(double distance) {
    // call use case

    // return: current distance, current time
  }
}

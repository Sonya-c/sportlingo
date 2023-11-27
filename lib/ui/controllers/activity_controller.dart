import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:sportlingo/data/model/user_location.dart';
import 'package:sportlingo/domain/use_case/locator_service.dart';

enum ActivityStatus { running, paused, finished, nonstarted }

class ActivityController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting a user...");
  }

  final RxDouble distance = 0.0.obs;
  final Rx<Duration> time = const Duration().obs;
  final Rx<ActivityStatus> status = ActivityStatus.nonstarted.obs;

  final userLocation = UserLocation(latitude: 0, longitude: 0).obs;
  final locatorService = Get.find<LocatorService>();

  late StreamSubscription<UserLocation> positionStreamSubscription;
  late Timer timer;

  double get currentDistance => distance.value;
  Duration get currentTime => time.value;
  ActivityStatus get currentStatus => status.value;
  UserLocation get currentLocation => userLocation.value;

  @override
  void onInit() {
    super.onInit();
    loggy.info("Initializing...");
  }

  clearActivity() {
    time.value = const Duration();
    distance.value = 0.0;
    userLocation.value = UserLocation(latitude: 0, longitude: 0);
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000;
  }

  Future<void> running() async {
    time.value += const Duration(seconds: 1);

    UserLocation prevUserLocation = userLocation.value;

    userLocation.value =
        await locatorService.getLocation().onError((error, stackTrace) {
      return Future.error(error.toString());
    });

    distance.value += calculateDistance(
      prevUserLocation.latitude,
      prevUserLocation.longitude,
      userLocation.value.latitude,
      userLocation.value.longitude,
    );

    loggy.info(
        "Location ${userLocation.value.latitude} ${userLocation.value.longitude}");
    loggy.info("Distance  ${distance.value}");
  }

  Future<void> starActivity() async {
    loggy.info("Starting an activity...");
    clearActivity();

    // set a timmer, each second call running fuction
    await subscribeLocationUpdates();
    userLocation.value =
        await locatorService.getLocation().onError((error, stackTrace) {
      return Future.error(error.toString());
    });

    timer = Timer.periodic(const Duration(seconds: 1), (_) => running());

    status.value = ActivityStatus.running;
  }

  Future<void> newActivity() async {
    loggy.info("Starting a new activity...");

    timer.cancel();
    clearActivity();

    status.value = ActivityStatus.nonstarted;
  }

  Future<void> pauseActivity() async {
    loggy.info("Pausing an activity...");
    timer.cancel();
    status.value = ActivityStatus.paused;
  }

  Future<void> resumeActivity() async {
    loggy.info("Pausing an activity...");

    // set a timmer, each second call running fuction
    timer = Timer.periodic(const Duration(seconds: 1), (_) => running());

    status.value = ActivityStatus.running;
  }

  Future<void> stopActivity() async {
    loggy.info("Stopping an activity...");

    timer.cancel();
    await unSubscribeLocationUpdates();

    status.value = ActivityStatus.finished;
  }

  Future<void> subscribeLocationUpdates() async {
    loggy.info('subscribe Location Updates');

    await locatorService.startStream().onError((error, stackTrace) {
      logError(
          "Controller subscribeLocationUpdates got the error ${error.toString()}");
      return Future.error(error.toString());
    });

    positionStreamSubscription = locatorService.locationStream.listen((event) {
      loggy.info("Controller event ${event.latitude}");
      userLocation.value = event;
    });
  }

  Future<void> unSubscribeLocationUpdates() async {
    logInfo('unSubscribeLocationUpdates');

    await locatorService.stopStream().onError((error, stackTrace) {
      logError(
          "Controller unSubscribeLocationUpdates got the error ${error.toString()}");
      return Future.error(error.toString());
    });

    positionStreamSubscription.cancel();
  }
}

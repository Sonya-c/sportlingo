import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:sportlingo/domain/use_case/locator_service.dart';
import 'package:sportlingo/ui/app.dart';
import 'package:sportlingo/ui/controllers/activity_controller.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/controllers/chat_controller.dart';
import 'package:sportlingo/ui/controllers/posts_controller.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';
import 'package:sportlingo/ui/controllers/users_controller.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  // Add the services
  Get.put(LocatorService());

  // Add the controllers
  Get.put(AuthController());
  Get.put(UserController());
  Get.put(UsersController());
  Get.put(PostsController());
  Get.put(ChatController());
  Get.put(ActivityController());

  runApp(App());
}

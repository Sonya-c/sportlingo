import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:sportlingo/ui/app.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );

  Get.put(AuthController());

  runApp(const App());
}

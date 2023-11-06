import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';
import 'package:sportlingo/ui/pages/content/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();

    return GetMaterialApp(
      title: 'Sportlingo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Obx(
        () => authController.isLogged ? const HomePage() : const LoginPage(),
      ),
    );
  }
}

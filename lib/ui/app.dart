import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';
import 'package:sportlingo/ui/pages/content/content.dart';
import 'package:sportlingo/ui/utils/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return GetMaterialApp(
      title: 'Sportlingo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: magenta),
        useMaterial3: true,
      ),
      home: _authController.isLogged ? Content() : const LoginPage(),
    );
  }
}

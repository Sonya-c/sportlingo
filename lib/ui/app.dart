import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';
import 'package:sportlingo/ui/pages/authentication/singup_page.dart';
import 'package:sportlingo/ui/pages/content/home_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';

class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, this.initialRoute = '/login'});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    const homePage = HomePage();
    const loginPage = LoginPage();
    const singupPage = SingupPage();

    return GetMaterialApp(
      title: 'Sportlingo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: magenta),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => Obx(
              () => authController.isLogged ? homePage : loginPage,
            ),
        '/singup': (context) => Obx(
              () => authController.isLogged ? homePage : singupPage,
            ),
        '/home': (context) => Obx(
              () => authController.isLogged ? homePage : loginPage,
            ),
      },
    );
  }
}

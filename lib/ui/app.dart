import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';
import 'package:sportlingo/ui/pages/authentication/singup_page.dart';
import 'package:sportlingo/ui/pages/content/content.dart';
import 'package:sportlingo/ui/utils/colors.dart';

class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, this.initialRoute = '/home'});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sportlingo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: magenta),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginPage(),
        '/singup': (context) => const SingupPage(),
        '/home': (context) => Content(),
      },
    );
  }
}

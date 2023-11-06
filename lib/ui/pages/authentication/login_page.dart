import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/pages/authentication/singup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FilledButton(
            onPressed: () async {
              await authController.login("email", "password");
            },
            child: const Text("Login"),
          ),
          Row(
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Get.to(() => const SingupPage());
                },
                child: const Text("Singup"),
              )
            ],
          )
        ],
      ),
    );
  }
}

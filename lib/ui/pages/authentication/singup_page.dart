import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Get.to(() => const LoginPage());
                },
                child: const Text("Login"),
              )
            ],
          )
        ],
      ),
    );
  }
}

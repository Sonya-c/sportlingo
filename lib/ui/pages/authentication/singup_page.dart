import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      key: const Key("singupPage"),
      backgroundGradient: orangeMagentaGradient,
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
    );
  }
}

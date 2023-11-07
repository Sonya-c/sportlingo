import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';
import 'package:sportlingo/ui/widgets/form_widets/email_field.dart';
import 'package:sportlingo/ui/widgets/form_widets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      key: const Key("loginPage"),
      backgroundGradient: orangeMagentaGradient,
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Login",
                style: fasterOne['3xl']?.copyWith(
                  color: Colors.white,
                  height: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    EmailField(
                      key: const Key("loginPageEmailField"),
                      emailController: _emailController,
                    ),
                    const SizedBox(height: 20),
                    PasswordField(
                      key: const Key("loginPagePasswordField"),
                      passwordController: _passwordController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FilledButton(
                key: const Key("loginPageLoginButton"),
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final form = _formKey.currentState;

                  form!.save();

                  if (form.validate()) {
                    await _authController.login(
                      _emailController.text,
                      _passwordController.text,
                    );
                  }
                },
                child: Text(
                  "Login",
                  style: sora['n']!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Or login with",
                style: sora['s']!.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                key: const Key("loginPageLoginWithGoogleButton"),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: Colors.white,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  await _authController.loginWithGoogle();
                },
                child: Text(
                  "Google",
                  style: sora['n']!.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: sora['s']!.copyWith(color: Colors.white),
                  ),
                  TextButton(
                    key: const Key("loginPageSingupButton"),
                    onPressed: () {
                      Get.toNamed('/singup');
                    },
                    child: Text(
                      "Sign Up",
                      style: sora['s']!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

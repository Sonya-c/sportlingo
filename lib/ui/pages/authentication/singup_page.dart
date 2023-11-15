import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';
import 'package:sportlingo/ui/pages/content/content.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';
import 'package:sportlingo/ui/widgets/form_widets/email_field.dart';
import 'package:sportlingo/ui/widgets/form_widets/password_field.dart';

class SingupPage extends StatelessWidget {
  SingupPage({super.key});

  final _authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ever(_authController.logged,
        (isLogged) => isLogged ? Get.to(() => Content()) : null);

    return Scaffold(
      body: ScrollLayout(
        key: const Key("singupPage"),
        backgroundGradient: orangeMagentaGradient,
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Sign Up",
                  style: fasterOne['5xl']?.copyWith(
                    color: Colors.white,
                    height: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name",
                              style: sora['s']?.copyWith(color: Colors.white)),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _nameController,
                            style: sora['s']?.copyWith(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(50, 255, 255, 255),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 15,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      EmailField(
                        key: const Key("singupPageEmailField"),
                        emailController: _emailController,
                      ),
                      const SizedBox(height: 20),
                      PasswordField(
                        key: const Key("singupPagePasswordField"),
                        passwordController: _passwordController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                FilledButton(
                  key: const Key("singupPageSingupButton"),
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
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
                      await _authController.singUp(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  child: Text(
                    "Signup",
                    style: sora['n']!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Or sign up with",
                  style: sora['s']!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  key: const Key("singupPageSingupWithGoogleButton"),
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
                    await _authController.singUpWithGoogle();
                  },
                  child: Text(
                    "Google",
                    style: sora['n']!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: sora['s']!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      key: const Key("singupPageLoginButton"),
                      onPressed: () {
                        Get.to(() => LoginPage());
                      },
                      child: Text(
                        "Login",
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
      ),
    );
  }
}

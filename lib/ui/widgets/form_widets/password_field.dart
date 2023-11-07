import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordField({super.key, required this.passwordController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password", style: sora['s']?.copyWith(color: Colors.white)),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.passwordController,
          style: sora['s']?.copyWith(color: Colors.white),
          obscureText: _hidePassword,
          obscuringCharacter: "*",
          validator: (value) => value!.length < 6
              ? "Password must be at least 6 characters long"
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(50, 255, 255, 255),
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 15,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            suffix: IconButton(
              icon: Icon(
                _hidePassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
                size: 15,
              ),
              onPressed: () {
                setState(() {
                  _hidePassword = !_hidePassword;
                });
              },
            ),
            errorStyle: sora['s']?.copyWith(color: amber),
          ),
        ),
      ],
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email", style: sora['s']?.copyWith(color: Colors.white)),
        const SizedBox(height: 10),
        TextFormField(
          controller: emailController,
          style: sora['s']?.copyWith(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          validator: (value) => EmailValidator.validate(value!)
              ? null
              : "Please enter a valid email",
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(50, 255, 255, 255),
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.white,
              size: 15,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: sora['s']?.copyWith(color: amber),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollLayout(
      children: [
        CircleAvatar(
          radius: 100,
          child: Icon(
            Icons.person,
            size: 90,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Name Lastname",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("@username")
      ],
    );
  }
}

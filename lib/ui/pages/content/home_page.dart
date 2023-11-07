import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        key: Key("homePage"),
        children: [Text("Home Page")],
      ),
    );
  }
}

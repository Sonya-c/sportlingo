import 'package:flutter/material.dart';

class ScrollLayout extends StatelessWidget {
  final List<Widget> children;
  final LinearGradient? backgroundGradient;
  final Color? backgroundColor;

  const ScrollLayout({
    super.key,
    required this.children,
    this.backgroundGradient,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: children),
        ),
      ),
    );
  }
}

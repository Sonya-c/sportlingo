import 'package:flutter/material.dart';

class ScrollLayout extends StatelessWidget {
  final List<Widget> children;
  final LinearGradient? backgroundGradient;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const ScrollLayout({
    super.key,
    required this.children,
    this.backgroundGradient,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        padding: padding,
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

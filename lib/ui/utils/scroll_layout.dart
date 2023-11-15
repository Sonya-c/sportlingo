import 'package:flutter/material.dart';

class ScrollLayout extends StatelessWidget {
  final List<Widget> children;
  final LinearGradient? backgroundGradient;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;

  const ScrollLayout(
      {super.key,
      required this.children,
      this.backgroundGradient,
      this.backgroundColor,
      this.padding,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: backgroundGradient,
      ),
      padding: padding,
      alignment: alignment,
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: children),
      ),
    );
  }
}

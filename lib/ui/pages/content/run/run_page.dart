import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class RunPage extends StatelessWidget {
  const RunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(children: [
      Text(
        "Let's run!",
        style: fasterOne['5xl'],
      ),
      const SizedBox(height: 25),
      SvgPicture.asset('assets/run_logo.svg'),
      const SizedBox(height: 25),
      FilledButton(onPressed: () {}, child: const Text("Start"))
    ]);
  }
}

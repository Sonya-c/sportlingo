import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class RunPage extends StatelessWidget {
  const RunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      children: [
        Text(
          "Let's run!",
          style: fasterOne['5xl'],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text("PAUSE"),
                ),
                FilledButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text("FINISH"))
              ],
            ),
            Row(
              children: [
                SvgPicture.asset('assets/run_logo.svg'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Distance", style: sora['n']),
                    Text("1km", style: blackOpsOne['xl']),
                    Text("Time", style: sora['n']),
                    Text("00:00:00", style: blackOpsOne['xl']),
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

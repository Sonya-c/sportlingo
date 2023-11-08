import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      padding: const EdgeInsets.all(10),
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: orangeMagentaGradient,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daily Objetives",
                style: blackOpsOne['l']!.copyWith(color: Colors.white),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: CircularPercentIndicator(
                          radius: 40,
                          lineWidth: 10,
                          percent: 0.65,
                          center: const Icon(Icons.directions_run,
                              color: Colors.white),
                          progressColor: orange,
                          backgroundColor: Colors.white.withOpacity(
                            0.5,
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                      Text(
                        "1.3km",
                        style: sora['n']!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "/2km",
                        style: sora['s']!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: CircularPercentIndicator(
                          radius: 40,
                          lineWidth: 10,
                          percent: 0.65,
                          center: const Icon(Icons.timer, color: Colors.white),
                          progressColor: orange,
                          backgroundColor: Colors.white.withOpacity(
                            0.5,
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                      Text(
                        "00:30:00",
                        style: sora['n']!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "00:45:00",
                        style: sora['s']!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: magenta,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Activities",
                style: blackOpsOne['l'],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.directions_run),
                  Text(
                    "1,3km",
                    style: sora['n']!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "00:00:00",
                    style: sora['n']!,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.directions_run),
                  Text(
                    "1,3km",
                    style: sora['n']!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "00:00:00",
                    style: sora['n']!,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.directions_run),
                  Text(
                    "1,3km",
                    style: sora['n']!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "00:00:00",
                    style: sora['n']!,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: magenta,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Post",
                style: blackOpsOne['l'],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Name Lastname",
                        style: sora['n']!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "@handle",
                        style: sora['s'],
                      ),
                    ],
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut euismod tellus. Suspendisse potenti",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: kBottomNavigationBarHeight,
        )
      ],
    );
  }
}

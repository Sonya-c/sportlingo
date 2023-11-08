import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';
import 'package:sportlingo/ui/utils/utils.dart';

class DailyObjetives extends StatelessWidget {
  final double currentDistance, goalDistance;
  final Duration currentTime, goalTime;

  const DailyObjetives({
    super.key,
    required this.currentDistance,
    required this.goalDistance,
    required this.currentTime,
    required this.goalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: blackOpsOne['xl']!.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10,
                      percent: currentDistance / goalDistance,
                      center: const Icon(
                        Icons.directions_run,
                        color: Colors.white,
                      ),
                      progressColor: orange,
                      backgroundColor: Colors.white.withOpacity(
                        0.5,
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${currentDistance}km",
                    style: sora['n']!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${goalDistance}km",
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
                      radius: 50,
                      lineWidth: 10,
                      percent: currentTime.inSeconds / goalTime.inSeconds,
                      center: const Icon(Icons.timer, color: Colors.white),
                      progressColor: orange,
                      backgroundColor: Colors.white.withOpacity(
                        0.5,
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    printDuration(currentTime),
                    style: sora['n']!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    printDuration(goalTime),
                    style: sora['s']!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

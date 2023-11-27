import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/activity_controller.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';
import 'package:sportlingo/ui/utils/utils.dart';

class RunPage extends StatelessWidget {
  RunPage({super.key});

  final _activityController = Get.find<ActivityController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ScrollLayout(
        backgroundGradient: amberOrangeGradient,
        children: _activityController.currentStatus == ActivityStatus.nonstarted
            ? [
                Text(
                  "Let's run!",
                  style: fasterOne['5xl'],
                ),
                const SizedBox(height: 100),
                SvgPicture.asset('assets/run_logo.svg'),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () => _activityController.starActivity(),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(30),
                    backgroundColor: amber,
                  ),
                  child: Text(
                    "RUN",
                    style: blackOpsOne['l']!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ]
            : _activityController.currentStatus == ActivityStatus.finished
                ? [
                    Text(
                      "Well done!",
                      style: fasterOne['5xl'],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          children: [
                            Placeholder(
                              fallbackHeight: 200,
                              fallbackWidth: 100,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Distance",
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text(
                                  _activityController.currentDistance
                                      .toStringAsFixed(2),
                                  style: blackOpsOne['xl'],
                                ),
                                const Text("km"),
                              ],
                            ),
                            const Text(
                              "Time",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              printDuration(_activityController.currentTime),
                              style: blackOpsOne['xl'],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => _activityController.starActivity(),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(30),
                            backgroundColor: amber,
                          ),
                          child: Text(
                            "RUN",
                            style: blackOpsOne['l']!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        FilledButton(
                          onPressed: () => _activityController.newActivity(),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(30),
                            backgroundColor: Colors.black,
                          ),
                          child: Text(
                            "OK",
                            style: blackOpsOne['l']!.copyWith(
                              color: amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                : [
                    Text(
                      _activityController.currentDistance.toStringAsFixed(2),
                      style: blackOpsOne['5xl'],
                    ),
                    Text(
                      printDuration(_activityController.currentTime),
                      style: blackOpsOne['3xl'],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_activityController.currentStatus ==
                                ActivityStatus.paused) {
                              _activityController.resumeActivity();
                            } else {
                              _activityController.pauseActivity();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20),
                            backgroundColor: Colors.black,
                          ),
                          child: Icon(
                            _activityController.currentStatus ==
                                    ActivityStatus.paused
                                ? Icons.play_arrow
                                : Icons.pause,
                            color: amber,
                            size: 50,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _activityController.stopActivity(),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20),
                            backgroundColor: Colors.black,
                          ),
                          child: const Icon(
                            Icons.stop,
                            color: amber,
                            size: 50,
                          ),
                        ),
                      ],
                    )
                  ],
      ),
    );
  }
}

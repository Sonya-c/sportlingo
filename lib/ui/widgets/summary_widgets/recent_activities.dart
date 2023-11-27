import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';
import 'package:sportlingo/ui/utils/utils.dart';

class RecentActivities extends StatelessWidget {
  final List activities;

  const RecentActivities({super.key, required this.activities});

  Widget activityRow(double distance, Duration duration) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.directions_run),
          Text(
            "${distance.toStringAsFixed(2)} m",
            style: sora['n']!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            printDuration(duration),
            style: sora['n']!,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Activities",
            style: blackOpsOne['l'],
          ),
          activities.isEmpty
              ? Container(
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/run_logo.svg', height: 100),
                      const SizedBox(width: 50),
                      const Text("So empty... Let's run")
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: activities.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return activityRow(
                      activities[index].distance,
                      activities[index].time,
                    );
                  },
                ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/widgets/summary_widgets/daily_objetives.dart';
import 'package:sportlingo/ui/widgets/summary_widgets/recent_activities.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Username"),
        ),
        body: const ScrollLayout(
          padding: EdgeInsets.all(10),
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username Lastname",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("@handle")
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec felis leo, porttitor quis justo at, dapibus ornare enim. Nullam eu mauris mollis, consequat justo."),
            DailyObjetives(
              currentDistance: 1,
              goalDistance: 100,
              currentTime: Duration(minutes: 1),
              goalTime: Duration(hours: 10),
            ),
            RecentActivities(activities: [
              {
                "distance": 0.1,
                "time": Duration(minutes: 5),
              },
              {
                "distance": 0.2,
                "time": Duration(minutes: 10),
              },
              {
                "distance": 1.0,
                "time": Duration(minutes: 10),
              },
            ])
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/widgets/summary_widgets/daily_objetives.dart';
import 'package:sportlingo/ui/widgets/summary_widgets/recent_activities.dart';
import 'package:sportlingo/ui/widgets/summary_widgets/top_posts.dart';

class HomePage extends StatelessWidget {
  final _userController = Get.find<UserController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ScrollLayout(
        alignment: Alignment.topCenter,
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        children: [
          DailyObjetives(
            currentDistance: _userController.currentDistance,
            goalDistance: _userController.currentGoalDistance,
            currentTime: _userController.currentTime,
            goalTime: _userController.currentGoalTime,
          ),
          RecentActivities(
            activities: _userController.currentActivities,
          ),
          const TopPosts(),
          const SizedBox(
            height: kBottomNavigationBarHeight,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';
import 'package:sportlingo/ui/widgets/daily_objetives.dart';

class HomePage extends StatelessWidget {
  final _userController = Get.find<UserController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      padding: const EdgeInsets.all(10),
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      children: [
        DailyObjetives(
          currentDistance: 1.3,
          goalDistance: 2,
          currentTime: const Duration(minutes: 30),
          goalTime: Duration(minutes: 45),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
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

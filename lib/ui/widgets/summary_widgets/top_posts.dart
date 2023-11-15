import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class TopPosts extends StatelessWidget {
  const TopPosts({super.key});

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
    );
  }
}

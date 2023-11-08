import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, strokeAlign: .5),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_circle),
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
                Text(
                  "Post Title",
                  style: sora['n']!.copyWith(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut euismod tellus. Suspendisse potenti",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                )
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_upward)),
              const Text("12"),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_downward)),
            ],
          )
        ],
      ),
    );
  }
}

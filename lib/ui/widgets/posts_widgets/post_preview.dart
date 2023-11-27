import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/pages/content/posts/post_page.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class PostPreview extends StatelessWidget {
  const PostPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(PostPage());
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Column(
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
      ),
    );
  }
}

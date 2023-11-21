import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_preview.dart';

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
          const PostPreview(),
          const PostPreview(),
          const PostPreview(),
        ],
      ),
    );
  }
}

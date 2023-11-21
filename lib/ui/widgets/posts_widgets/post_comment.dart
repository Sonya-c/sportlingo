import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class PostComment extends StatelessWidget {
  final String username;
  final String handle;
  final String date;
  final String content;

  const PostComment({
    super.key,
    required this.username,
    required this.handle,
    required this.date,
    required this.content,
  });

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 15,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    username,
                    style: sora['n']!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "@$handle",
                    style: sora['s'],
                  ),
                  const SizedBox(width: 5),
                  Text(" • $date", style: sora['s'])
                ],
              ),
              const SizedBox(
                  height: 5), // Add some space between the row and content text
              Text(
                content,
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class PostHeader extends StatelessWidget {
  final String username;
  final String handle;
  final String date;

  const PostHeader(
      {super.key,
      required this.username,
      required this.handle,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 15,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: sora['n']!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "@$handle",
                  style: sora['s'],
                ),
              ],
            )
          ],
        ),
        Text(date)
      ],
    );
  }
}

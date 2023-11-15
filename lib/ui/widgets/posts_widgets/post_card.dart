import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String handle;
  final String title;
  final String? body;
  final String date;
  final int rating;
  final bool upvote;

  const PostCard({
    super.key,
    required this.username,
    required this.handle,
    required this.title,
    this.body,
    required this.date,
    required this.rating,
    required this.upvote,
  });

  Widget postCardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.account_circle),
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

  Widget postCardBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: sora['m']!.copyWith(fontWeight: FontWeight.bold),
              ),
              body == null
                  ? const SizedBox()
                  : Text(
                      body!,
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
              onPressed: () {},
              icon: const Icon(Icons.arrow_upward),
              color: upvote ? Colors.green : Colors.grey,
            ),
            Text(rating.toString()),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_downward),
              color: !upvote ? Colors.red : Colors.grey,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            children: [
              postCardTitle(),
              postCardBody(),
            ],
          ),
        ],
      ),
    );
  }
}

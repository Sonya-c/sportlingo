import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/pages/content/posts/post_page.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_header.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String handle;
  final String? body;
  final String date;
  final int rating;
  final bool upvote;

  const PostCard({
    super.key,
    required this.username,
    required this.handle,
    required this.body,
    required this.date,
    required this.rating,
    required this.upvote,
  });

  Widget postCardBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              body == null
                  ? const SizedBox()
                  : Text(
                      body!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
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
            offset: const Offset(0, 1),
          )
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            children: [
              InkWell(
                child: PostHeader(
                  username: username,
                  handle: handle,
                  date: date,
                ),
                onTap: () {
                  Get.to(() => PostPage());
                },
              ),
              InkWell(
                child: postCardBody(),
                onTap: () {
                  Get.to(() => PostPage());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

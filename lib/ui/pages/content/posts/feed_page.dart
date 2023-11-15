import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_card.dart';
import 'package:sportlingo/ui/controllers/posts_controller.dart';

class FeedPage extends StatelessWidget {
  final _postController = Get.find<PostsController>();

  FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ScrollLayout(
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _postController.currentPosts.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return PostCard(
                username: _postController.currentPosts[index]["username"],
                handle: _postController.currentPosts[index]["handle"],
                title: _postController.currentPosts[index]["title"],
                body: _postController.currentPosts[index]["body"],
                date: _postController.currentPosts[index]["date"],
                rating: _postController.currentPosts[index]["rating"],
                upvote: _postController.currentPosts[index]["upvote"],
              );
            },
          ),
          const SizedBox(
            height: kBottomNavigationBarHeight,
          )
        ],
      ),
    );
  }
}

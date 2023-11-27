import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/pages/content/posts/create_post_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';
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
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        children: [
          InkWell(
            onTap: () {
              Get.to(() => CreatePostPage());
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: orangeMagentaGradient,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CircleAvatar(),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Text("What's happening?"),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: _postController.currentPosts.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return PostCard(
                username: _postController.currentPosts[index]["username"],
                handle: _postController.currentPosts[index]["handle"],
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

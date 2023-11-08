import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_card.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollLayout(
      children: [
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
      ],
    );
  }
}

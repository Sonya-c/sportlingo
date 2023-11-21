import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_comment.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_header.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});

  final List comments = [
    {
      "user_id": "user1",
      "username": "pepito",
      "handle": "handle1",
      "body": "comment body",
      "date": "12, Ago",
    },
    {
      "user_id": "user1",
      "username": "pepito",
      "handle": "handle1",
      "body":
          "comment body. comment body. comment body. comment body. comment bodycomment bodycomment bodycomment bodycomment bodycomment bodycomment bodycomment bodycomment bodycomment bodycomment bodycomment body",
      "date": "12, Ago",
    },
    {
      "user_id": "user2",
      "username": "Maria dolores",
      "handle": "mdolores",
      "body": "no me gusta",
      "date": "hoy"
    },
    {
      "user_id": "user2",
      "username": "Maria dolores",
      "handle": "mdolores",
      "body": "no me gusta",
      "date": "hoy"
    },
    {
      "user_id": "user2",
      "username": "Maria dolores",
      "handle": "mdolores",
      "body": "no me gusta",
      "date": "hoy"
    },
    {
      "user_id": "user2",
      "username": "Maria dolores",
      "handle": "mdolores",
      "body": "no me gusta",
      "date": "hoy"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post"),
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: amber,
              height: 4.0,
            ),
          ),
          shadowColor: Colors.black,
        ),
        body: ScrollLayout(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const PostHeader(
                    username: "pepitp",
                    handle: "el pepe",
                    date: "nov 20",
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di. Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di. Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di"),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_upward),
                        // color: false ? Colors.green : Colors.grey,
                      ),
                      const Text("12"),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_downward),
                        // color: true ? Colors.red : Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostComment(
                        username: comments[index]["username"],
                        handle: comments[index]["user_id"],
                        date: comments[index]["date"],
                        content: comments[index]["body"],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade500,
                width: 1.0,
              ),
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.comment,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 10),
                  const Text("Add a comment"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

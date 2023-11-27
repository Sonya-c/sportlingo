import 'package:flutter/material.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_comment.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 10),
                Text("Friend name"),
              ],
            ),
          ),
          body: ScrollLayout(
            alignment: Alignment.bottomCenter,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: const PostComment(
                      username: "username",
                      handle: "handle",
                      date: "date",
                      content:
                          "content content content content content content content content content content content content ",
                    ),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: fromKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: "Type a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

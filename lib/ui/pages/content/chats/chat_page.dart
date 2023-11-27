import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportlingo/data/model/chat.dart';
import 'package:sportlingo/ui/controllers/chat_controller.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';
import 'package:sportlingo/ui/controllers/users_controller.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_comment.dart';

class ChatPage extends StatefulWidget {
  final Chat chat;

  const ChatPage({super.key, required this.chat});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatController = Get.find<ChatController>();
  final userController = Get.find<UserController>();
  final usersController = Get.find<UsersController>();

  final dateFormat = DateFormat('yyyy-MM-dd hh:mm');

  final TextEditingController _textEditingController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 10),
                Text(
                  usersController
                      .getUserById(widget.chat.people[0] ==
                              userController.currentUser.uid
                          ? widget.chat.people[1]
                          : widget.chat.people[0])!
                      .name,
                ),
              ],
            ),
          ),
          body: ScrollLayout(
            alignment: Alignment.bottomCenter,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: widget.chat.messages.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: PostComment(
                      username: usersController
                          .getUserById(widget.chat.messages[index].from)!
                          .name,
                      date: dateFormat.format(widget.chat.messages[index].date),
                      content: widget.chat.messages[index].content,
                    ),
                  );
                },
              ),
            ],
          ),
          bottomSheet: Container(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a message';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        chatController.sendMessage(
                          widget.chat.key,
                          Message(
                            from: userController.currentUser.uid,
                            content: _textEditingController.text,
                            date: DateTime.now(),
                          ),
                        );
                        _textEditingController.clear();
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

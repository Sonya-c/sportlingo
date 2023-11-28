import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:sportlingo/data/model/chat.dart';
import 'package:sportlingo/ui/controllers/chat_controller.dart';
import 'package:sportlingo/ui/controllers/users_controller.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';

import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/widgets/posts_widgets/post_comment.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final userController = Get.find<UserController>();
  final usersController = Get.find<UsersController>();
  final chatController = Get.find<ChatController>();

  final dateFormat = DateFormat('yyyy-MM-dd hh:mm');

  late TextEditingController _textEditingController;
  late GlobalKey<FormState> fromKey;

  dynamic argumentData = Get.arguments;
  late String chatKey;

  @override
  void initState() {
    super.initState();

    chatKey = argumentData;

    _textEditingController = TextEditingController();
    fromKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _list() {
    return GetX<ChatController>(builder: (controller) {
      final chat =
          controller.chats.firstWhere((element) => element.key == chatKey);

      return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: chat.messages.length,
        itemBuilder: (context, index) {
          var message = chat.messages[index];

          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: PostComment(
              username: usersController.getUserById(message.from)!.name,
              date: dateFormat.format(message.date),
              content: message.content,
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const CircleAvatar(),
              const SizedBox(width: 10),
              Text(
                usersController
                    .getUserById(chatController.chats
                        .firstWhere((element) => element.key == chatKey)!
                        .people
                        .firstWhere((element) =>
                            element != userController.currentUser.uid)
                        .toString())!
                    .name,
              ),
            ],
          ),
        ),
        body: ScrollLayout(
          backgroundColor: const Color.fromARGB(255, 236, 236, 236),
          alignment: Alignment.bottomCenter,
          children: [
            _list(),
            const SizedBox(
              height: 100,
            )
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
                        chatKey,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/data/model/chat.dart';
import 'package:sportlingo/ui/controllers/chat_controller.dart';
import 'package:sportlingo/ui/controllers/users_controller.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';
import 'package:sportlingo/ui/pages/content/chats/chat_page.dart';

import 'package:sportlingo/ui/utils/scroll_layout.dart';

class SearchChatPage extends StatelessWidget {
  SearchChatPage({super.key});

  final userController = Get.find<UserController>();
  final usersController = Get.find<UsersController>();
  final chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("All users"),
          backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        ),
        body: ScrollLayout(
          backgroundColor: const Color.fromARGB(255, 236, 236, 236),
          alignment: Alignment.topLeft,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: usersController.users.length,
              itemBuilder: (context, index) {
                if (usersController.users[index].uid ==
                    userController.currentUser.uid) {
                  return null;
                }

                return InkWell(
                  onTap: () async {
                    Chat chat = await chatController.createChat([
                      usersController.users[index].uid,
                      userController.currentUser.uid
                    ]);

                    Get.back();
                    Get.to(() => ChatPage(chat: chat));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          usersController.users[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

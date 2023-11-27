import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/chat_controller.dart';
import 'package:sportlingo/ui/controllers/user_controller.dart';
import 'package:sportlingo/ui/controllers/users_controller.dart';
import 'package:sportlingo/ui/pages/content/chats/chat_page.dart';
import 'package:sportlingo/ui/pages/content/chats/search_chat_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({super.key});

  final chatController = Get.find<ChatController>();
  final userController = Get.find<UserController>();
  final usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ScrollLayout(
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        alignment: Alignment.topLeft,
        children: [
          Container(
            color: amber,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  "Chats",
                  style: fasterOne['m'],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Get.to(() => SearchChatPage());
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
          ),
          GetX<ChatController>(
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: controller.chats.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => ChatPage(
                        chat: controller.chats[index],
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const CircleAvatar(),
                        const SizedBox(width: 10),
                        Text(
                          usersController
                              .getUserById(controller.chats[index].people[0] ==
                                      userController.currentUser.uid
                                  ? controller.chats[index].people[1]
                                  : controller.chats[index].people[0])!
                              .name,
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
            ),
          ),
        ],
      ),
    );
  }
}

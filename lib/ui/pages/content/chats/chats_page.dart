import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/chat_controller.dart';
import 'package:sportlingo/ui/pages/content/chats/chat_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';
import 'package:sportlingo/ui/utils/text_styles.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({super.key});

  final chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ScrollLayout(
        backgroundColor: Colors.grey.shade100,
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
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: chatController.chats.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => const ChatPage());
                },
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(width: 10),
                      Text(chatController.chats[index].people[0]),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

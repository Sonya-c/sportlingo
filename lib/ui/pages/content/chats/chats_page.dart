import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/pages/content/chats/chat_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List chats = [
      {
        "friend": "Maria",
        "msgs": [
          {"from": "maria", "date": "20/10/23", "content": "hello, bitch"},
          {"from": "", "date": "20/10/23", "content": "hello, mf"}
        ]
      },
      {
        "friend": "Ugly brother",
        "msgs": [
          {
            "from": "ugly brother",
            "date": "21/10/23",
            "content": "can you print something?"
          },
          {"from": "", "date": "21/10/23", "content": "fine"},
          {"from": "ugly brother", "date": "21/10/23", "content": "love ya"},
          {"from": "", "date": "21/10/23", "content": "hate ya"},
        ]
      }
    ];

    return ScrollLayout(
      backgroundColor: Colors.grey.shade100,
      alignment: Alignment.topLeft,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: chats.length,
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
                    Text(chats[index]["friend"]),
                  ],
                ),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_outline_rounded,
                  size: 30,
                  color: magenta,
                )),
          ],
        )
      ],
    );
  }
}

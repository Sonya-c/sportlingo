import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/controllers/users_controller.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';

class SearchChatPage extends StatelessWidget {
  SearchChatPage({super.key});

  final usersController = Get.find<UsersController>();

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
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: usersController.users.length,
              itemBuilder: (context, index) {
                return Text(usersController.users[index].name);
              },
            )
          ],
        ),
      ),
    );
  }
}

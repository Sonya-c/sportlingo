import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class ChatController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting posts...");
  }

  final RxList chats = [
    {
      "chat_id": 1,
      "user_id": 1,
      "messanges": [
        {
          "from": 1,
          "content": "hola",
        },
        {"from": 2, "content": "adios"}
      ]
    }
  ].obs;

  List get currentChats => chats;

  addChat(userId) {}

  sendMessange(int chatId, String msg) {}

  deleteChat(int chatId) {}
}

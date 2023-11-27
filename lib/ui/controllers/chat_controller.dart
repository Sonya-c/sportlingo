import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import '../../data/model/chat.dart';

class ChatController extends GetxController with UiLoggy {
  final databaseRef = FirebaseDatabase.instance.ref();
  final authController = Get.find<AuthController>();

  final RxList<Chat> _chats = <Chat>[].obs;

  List<Chat> get chats => _chats.toList();

  @override
  void onInit() {
    super.onInit();
    ever(authController.logged, (logged) => getChats());
  }

  Future<void> getChats() async {
    // TODO: get chats from a user
    // copilot created this
    // this is called each time the user is loged

    /* databaseRef.child('chats').onValue.listen((event) {
      final chatsData = event.snapshot.value as Map<dynamic, dynamic>;
      List<Chat> chats = [];
      chatsData.forEach((key, value) {
        chats.add(Chat.fromJson(event.snapshot, value));
      });
      _chats.value = chats;
    });*/
  }

  Future<Chat> createChat(List<String> people) async {
    Chat newChat = Chat(people: people, messages: []);
    // TODO: check if chat already exists
    DatabaseReference newChatRef = await databaseRef.child('chats').push();
    newChat.key = newChatRef.key;
    await newChatRef.set(newChat.toJson());
    _chats.add(newChat);

    return newChat;
  }

  Future<void> sendMessage(String? chatKey, Message message) async {
    chats.firstWhere((chat) => chat.key == chatKey).messages.add(message);

    await databaseRef
        .child('chats')
        .child(chatKey!)
        .child('messages')
        .push()
        .set(message.toJson());
  }

  void getChatHistory(String chatKey) {
    databaseRef.child('chats').child(chatKey).onValue.listen((event) {
      final chatData = event.snapshot.value as Map<dynamic, dynamic>;
      Chat updatedChat = Chat.fromJson(event.snapshot, chatData);
      int index = chats.indexWhere((chat) => chat.key == chatKey);
      if (index != -1) {
        _chats[index] = updatedChat;
      } else {
        _chats.add(updatedChat);
      }
    });
  }

  Future<void> deleteChat(String chatKey) async {
    await databaseRef.child('chats').child(chatKey).remove();
    _chats.removeWhere((chat) => chat.key == chatKey);
  }
}

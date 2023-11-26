import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../data/model/chat.dart';

class ChatController extends GetxController with UiLoggy {
  final databaseRef = FirebaseDatabase.instance.ref();

  final RxList<Chat> _chats = <Chat>[].obs;

  List<Chat> get chats => _chats.toList();

  Future<void> createChat(List<String> people) async {
    Chat newChat = Chat(people: people, messages: []);
    DatabaseReference newChatRef = await databaseRef.child('chats').push();
    newChat.key = newChatRef.key;
    await newChatRef.set(newChat.toJson());
    _chats.add(newChat);
  }

  Future<void> sendMessage(String chatKey, Message message) async {
    await databaseRef.child('chats').child(chatKey).child('messages').push().set(message.toJson());
    // Update local chat list if needed
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

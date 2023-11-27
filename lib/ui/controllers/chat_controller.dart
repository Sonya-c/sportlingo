import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import '../../data/model/chat.dart';

class ChatController extends GetxController with UiLoggy {
  final databaseRef = FirebaseDatabase.instance.ref();
  final authController = Get.find<AuthController>();

  final RxList<Chat> _chats = <Chat>[].obs;
  Map<String, StreamSubscription<DatabaseEvent>> _chatSubscriptions = {};
  List<Chat> get chats => _chats.toList();

  @override
  void onInit() {
    super.onInit();
    ever(authController.logged, (logged) => getChats());
  }

  @override
  void onClose() {
    // Cancel all subscriptions when the controller is closed
    _chatSubscriptions.forEach((key, subscription) {
      subscription.cancel();
    });
    super.onClose();
  }

  Future<void> getChats() async {
    try {
      String currentUserId =
          authController.getUid(); // Ensure this gets the correct user ID
      DataSnapshot userSnapshot =
          await databaseRef.child('users').child(currentUserId).get();
      Map<dynamic, dynamic> userData =
          userSnapshot.value as Map<dynamic, dynamic>;

      List<String> chatIds = List<String>.from(userData['chats'] ?? []);

      _chats.clear(); // Clear existing chats before fetching new ones

      for (String chatId in chatIds) {
        DataSnapshot chatSnapshot =
            await databaseRef.child('chats').child(chatId).get();
        if (chatSnapshot.exists) {
          Map<dynamic, dynamic> chatData =
              chatSnapshot.value as Map<dynamic, dynamic>;
          Chat chat = Chat.fromJson(chatSnapshot, chatData);
          _chats.add(chat); // Add each chat to the observable list
          // Optionally, set up real-time listener for each chat
          getChatHistory(chatId);
        }
      }
    } catch (e) {
      logError("Error fetching chats: $e");
    }
  }

  Future<Chat> createChat(List<String> people) async {
    // Sort the list to ensure consistent order regardless of how the IDs are passed
    people.sort();

    // Check if a chat with these exact people already exists
    Query query = databaseRef
        .child('chats')
        .orderByChild('people')
        .equalTo(people.join(","));
    DataSnapshot snapshot = await query.get();

    if (snapshot.exists) {
      // Chat already exists, return the existing chat
      Map<dynamic, dynamic> chatData = snapshot.value as Map<dynamic, dynamic>;
      String existingChatKey = chatData.keys.first;
      Chat existingChat = Chat.fromJson(
          snapshot.child(existingChatKey), chatData[existingChatKey]);
      return existingChat;
    } else {
      // Create a new chat
      Chat newChat = Chat(people: people, messages: []);
      DatabaseReference newChatRef = await databaseRef.child('chats').push();
      newChat.key = newChatRef.key;
      await newChatRef.set(newChat.toJson());
      _chats.add(newChat);
      return newChat;
    }
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
    // Cancel previous subscription if it exists
    _chatSubscriptions[chatKey]?.cancel();

    // Listen for changes in the chat
    _chatSubscriptions[chatKey] =
        databaseRef.child('chats').child(chatKey).onValue.listen((event) {
      final chatData = event.snapshot.value as Map<dynamic, dynamic>;
      Chat updatedChat = Chat.fromJson(event.snapshot, chatData);
      int index = _chats.indexWhere((chat) => chat.key == chatKey);
      if (index != -1) {
        _chats[index] = updatedChat;
      } else {
        _chats.add(updatedChat);
      }
    });
  }

  // Method to cancel a chat subscription
  void cancelChatSubscription(String chatKey) {
    if (_chatSubscriptions.containsKey(chatKey)) {
      _chatSubscriptions[chatKey]!.cancel(); // Cancel the subscription
      _chatSubscriptions.remove(chatKey); // Remove from the map
    }
  }
}

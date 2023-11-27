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

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;
  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  get chats {
    AuthController authController = Get.find();
    return _chats
        .where((entry) => entry.people.contains(authController.getUid()))
        .toList();
  }

  final started = false.obs;

  List<Chat> get allChats => _chats.toList();

  void start() {
    _chats.clear();

    if (started.value) return;
    started.value = true;

    newEntryStreamSubscription =
        databaseRef.child("chats").onChildAdded.listen(_onEntryAdded);

    updateEntryStreamSubscription =
        databaseRef.child("chats").onChildChanged.listen(_onEntryChanged);
  }

  void stop() {
    if (!started.value) return;
    started.value = false;
    newEntryStreamSubscription.cancel();
    updateEntryStreamSubscription.cancel();
  }

  _onEntryAdded(DatabaseEvent event) {
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _chats.add(Chat.fromJson(event.snapshot, json));
  }

  _onEntryChanged(DatabaseEvent event) {
    var oldEntry = _chats.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _chats[_chats.indexOf(oldEntry)] = Chat.fromJson(event.snapshot, json);
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
}

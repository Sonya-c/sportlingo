import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class Chat {
  String? key;
  List<String> people;
  List<Message> messages;

  Chat({
    this.key,
    required this.people,
    required this.messages,
  });

  Chat.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        people = List<String>.from(json['people'] ?? []),
        messages = json['messages'] != null
            ? _convertMessages(json['messages'])
            : []; // Provide an empty list if null

  static List<Message> _convertMessages(dynamic messagesJson) {
    List<Message> messages;

    if (messagesJson is List) {
      // If it's already a list, process it directly
      messages = messagesJson.map((item) => Message.fromJson(item)).toList();
    } else if (messagesJson is Map) {
      // If it's a map, convert it to a list first
      messages =
          messagesJson.values.map((item) => Message.fromJson(item)).toList();
    } else {
      return []; // Return an empty list for any other case
    }

    messages.sort((a, b) => a.date.compareTo(b.date));
    return messages;
  }

  toJson() {
    return {
      "people": people,
      "messages": messages.map((message) => message.toJson()).toList(),
    };
  }
}

class Message {
  DateTime date;
  String from;
  String content;

  Message({required this.date, required this.from, required this.content});

  Message.fromJson(Map<dynamic, dynamic> json)
      : date = json['date'] != null
            ? DateTime.parse(json['date'])
            : DateTime.now(), // Provide current date if null
        from = json['from'] ?? "from",
        content = json['content'] ?? "content";

  Map<String, dynamic> toJson() {
    return {
      "date": date.toIso8601String(),
      "from": from,
      "content": content,
    };
  }
}

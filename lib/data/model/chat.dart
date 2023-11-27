import 'package:firebase_database/firebase_database.dart';

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
                  ? (json['messages'] as List).map((item) => Message.fromJson(item)).toList()
                  : []; // Provide an empty list if null

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
      : date = json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(), // Provide current date if null
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

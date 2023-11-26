import 'package:firebase_database/firebase_database.dart';

class Post {
  String? postId;
  String userId;
  DateTime date;
  String content;

  Post({
    this.postId,
    required this.userId,
    required this.date,
    required this.content,
  });

  Post.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : postId = snapshot.key,
        userId = json['userId'] ?? "",
        date = DateTime.parse(json['date']),
        content = json['content'] ?? "";

  toJson() {
    return {
      "userId": userId,
      "date": date.toIso8601String(),
      "content": content,
    };
  }
}

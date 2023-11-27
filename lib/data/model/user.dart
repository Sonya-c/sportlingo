import 'package:firebase_database/firebase_database.dart';

class User {
  String? key;
  String name;
  String username;
  String email;
  String uid;
  int timeGoal;
  int distanceGoal;
  List<Activity> activities;
  List<String> chats;

  User({
    this.key,
    required this.name,
    required this.username,
    required this.email,
    required this.uid,
    required this.timeGoal,
    required this.distanceGoal,
    required this.activities,
    required this.chats,
  });

  User.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        name = json['name'] ?? "name",
        username = json['username'] ?? "username",
        email = json['email'] ?? "email",
        uid = json['uid'] ?? "uid",
        timeGoal = json['timeGoal'] ?? 0,
        distanceGoal = json['distanceGoal'] ?? 0,
        activities = json['activities'] != null 
                    ? (json['activities'] as List).map((item) => Activity.fromJson(item)).toList()
                    : [], // Provide an empty list if null
        chats = json['chats'] != null 
                ? List<String>.from(json['chats'])
                : []; // Provide an empty list if null

  toJson() {
    return {
      "name": name,
      "username": username,
      "email": email,
      "uid": uid,
      "timeGoal": timeGoal,
      "distanceGoal": distanceGoal,
      "activities": activities.map((activity) => activity.toJson()).toList(),
      "chats": chats,
    };
  }
}

class Activity {
  DateTime date;
  Duration time;
  double distance;

  Activity({required this.date, required this.time, required this.distance});

  Activity.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date']),
        time = Duration(minutes: json['time'] ?? 0),
        distance = json['distance'] ?? 0.0;

  Map<String, dynamic> toJson() {
    return {
      "date": date.toIso8601String(),
      "time": time.inMinutes,
      "distance": distance,
    };
  }
}


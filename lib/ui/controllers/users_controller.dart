import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UsersController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting a user...");
  }

  getUserById() {
    return {
      "userId": 1,
      "username": 2,
      "activities": [
        {
          "distance": 0.1,
          "time": const Duration(minutes: 5),
        },
        {
          "distance": 0.2,
          "time": const Duration(minutes: 10),
        },
        {
          "distance": 1.0,
          "time": const Duration(minutes: 10),
        },
      ],
      "posts": [
        {
          "postid": 1,
          "username": "user0",
          "handle": "handle0",
          "title": "Lorem ipsum dolor sit amet",
          "body":
              "Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di",
          "date": "12, Ago",
          "rating": 12,
          "upvote": true,
        },
      ]
    };
  }

  blockUserById() {}
}

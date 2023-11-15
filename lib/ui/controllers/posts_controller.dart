import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class PostsController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting posts...");
  }

  final RxList posts = [
    {
      "postid": 1,
      "username": "user0",
      "handle": "handle0",
      "body":
          "Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "postid": 2,
      "username": "user1",
      "handle": "handle1",
      "body":
          "di amet facilisis magna etiam tempor orci eu lobortis. Nunc sed id semper risus in hendrerit gravida rutrum quisque non. ",
      "date": "12, Ago",
      "rating": 12,
      "upvote": false,
    },
    {
      "postid": 3,
      "username": "user2",
      "handle": "handle2",
      "body": "Sed do eiusmod tempor incididunt",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "postid": 4,
      "username": "user2",
      "handle": "handle2",
      "body":
          "non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor.",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "postid": 5,
      "username": "user2",
      "handle": "handle2",
      "body":
          "ipsum dolor. Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di.",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "postid": 6,
      "username": "user2",
      "handle": "handle2",
      "body": "quis nostrud exercitation ullamco",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "postid": 7,
      "username": "user2",
      "handle": "handle2",
      "body":
          "di. Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di.",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    }
  ].obs;

  List get currentPosts => posts;

  PostsController() {
    // get current posts from use case
  }

  createPost(String title, String body) {
    // call use case
    // return: current posts
  }

  votePost() {}
}

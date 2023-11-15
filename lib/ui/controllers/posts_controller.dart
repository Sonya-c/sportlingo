import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class PostsController extends GetxController with UiLoggy {
  setUser() {
    loggy.info("Getting posts...");
  }

  final RxList posts = [
    {
      "username": "user0",
      "handle": "handle0",
      "title": "Lorem ipsum dolor sit amet",
      "body":
          "Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "username": "user1",
      "handle": "handle1",
      "title": "Consectetur adipiscing elit",
      "body":
          "di amet facilisis magna etiam tempor orci eu lobortis. Nunc sed id semper risus in hendrerit gravida rutrum quisque non. ",
      "date": "12, Ago",
      "rating": 12,
      "upvote": false,
    },
    {
      "username": "user2",
      "handle": "handle2",
      "title": "Sed do eiusmod tempor incididunt",
      "body": null,
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "username": "user2",
      "handle": "handle2",
      "title": "ut labore et dolore magna aliqua",
      "body":
          "non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor.",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "username": "user2",
      "handle": "handle2",
      "title": "Ut enim ad minim veniam",
      "body":
          "ipsum dolor. Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla facilisi etiam di.",
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "username": "user2",
      "handle": "handle2",
      "title": "quis nostrud exercitation ullamco",
      "body": null,
      "date": "12, Ago",
      "rating": 12,
      "upvote": true,
    },
    {
      "username": "user2",
      "handle": "handle2",
      "title": "laboris nisi ut aliquip ex ea commodo",
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

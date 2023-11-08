// check https://bootcamp.uxdesign.cc/create-a-beautiful-bottom-navigation-bar-in-flutter-part-2-9f7af63cb0bf

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:sportlingo/ui/controllers/auth_controller.dart';
import 'package:sportlingo/ui/pages/authentication/login_page.dart';
import 'package:sportlingo/ui/pages/content/chats/chats_page.dart';
import 'package:sportlingo/ui/pages/content/home_page.dart';
import 'package:sportlingo/ui/pages/content/posts/posts_page.dart';
import 'package:sportlingo/ui/pages/content/profile/profile_page.dart';
import 'package:sportlingo/ui/pages/content/run/run_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';

class Content extends StatefulWidget with UiLoggy {
  final int initialPage;
  final PageController _pageController;

  Content({Key? key, this.initialPage = 0})
      : _pageController = PageController(initialPage: initialPage),
        super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final _authController = Get.find<AuthController>();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    ever(_authController.logged,
        (isLogged) => isLogged ? null : Get.to(() => LoginPage()));

    return Scaffold(
      body: PageView(
        controller: widget._pageController,
        onPageChanged: (value) => {
          setState(() {
            _pageIndex = value;
          })
        },
        children: const <Widget>[
          HomePage(),
          PostPage(),
          RunPage(),
          ChatsPage(),
          ProfilePage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: magenta,
        color: Colors.white,
        height: 50,
        index: _pageIndex,
        items: [
          Icon(
            Icons.home_rounded,
            size: 30,
            color: _pageIndex == 0 ? Colors.white : orange,
          ),
          Icon(
            Icons.language_rounded,
            size: 30,
            color: _pageIndex == 1 ? Colors.white : orange,
          ),
          Icon(
            Icons.directions_run,
            size: 30,
            color: _pageIndex == 2 ? Colors.white : orange,
          ),
          Icon(
            Icons.chat_rounded,
            size: 30,
            color: _pageIndex == 3 ? Colors.white : orange,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: _pageIndex == 4 ? Colors.white : orange,
          ),
        ],
        animationDuration: const Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
          widget._pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
        },
      ),
    );
  }
}

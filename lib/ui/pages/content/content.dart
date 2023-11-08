// check https://bootcamp.uxdesign.cc/create-a-beautiful-bottom-navigation-bar-in-flutter-part-2-9f7af63cb0bf

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:sportlingo/ui/pages/content/chats/chats_page.dart';
import 'package:sportlingo/ui/pages/content/home_page.dart';
import 'package:sportlingo/ui/pages/content/posts/posts_page.dart';
import 'package:sportlingo/ui/pages/content/profile/profile_page.dart';
import 'package:sportlingo/ui/pages/content/run/run_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';

class Content extends StatelessWidget with UiLoggy {
  final int initialPage;
  final PageController _pageController;

  Content({Key? key, this.initialPage = 0})
      : _pageController = PageController(initialPage: initialPage),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
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
        backgroundColor: Colors.white.withOpacity(0.5),
        buttonBackgroundColor: magenta,
        color: magentaDark,
        height: 50,
        index: initialPage,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.language, size: 30, color: Colors.white),
          Icon(Icons.directions_run, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        animationDuration: const Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut);
        },
      ),
    );
  }
}

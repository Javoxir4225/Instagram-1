import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/pages/main/home/create_post_page.dart';
import 'package:instagram/pages/main/home/feed_page.dart';
import 'package:instagram/pages/main/home/profile_page.dart';
import 'package:instagram/pages/main/home/search_page.dart';

class HomePage extends StatefulWidget {
  final void Function(int index) onTabChanged;
  PageController controller;
   HomePage({super.key, required this.onTabChanged,required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: ColorName.purpleRed,
        currentIndex: currentIndex,
        onTap: (value) {
          widget.onTabChanged(value);
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
            Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.search,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_alt_circle,
            ),
          ),
        ],
      ),
    );
  }

  getPage() {
    switch (currentIndex) {
      case 0:
        return FeedPage(controller: widget.controller,);
      case 1:
        return SearchPage();
      case 2:
        return const CreatePostPage();
      case 3:
        return Container();
      case 4:
        return ProfilePage();
      default:
        return Container();
    }
  }
}

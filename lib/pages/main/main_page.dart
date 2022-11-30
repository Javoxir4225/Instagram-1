import 'package:flutter/material.dart';
import 'package:instagram/pages/main/camera_page.dart';
import 'package:instagram/pages/main/direct_page.dart';
import 'package:instagram/pages/main/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = PageController(initialPage: 1);

  ScrollPhysics? currentPhysics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: currentPhysics,
        children: [
          const CameraPage(),
          HomePage(onTabChanged: (int index) {
            if (currentPhysics != null && index == 0) {
              setState(() {
                currentPhysics = null;
              });
            } else if (currentPhysics == null && index != 0) {
              setState(() {
                currentPhysics = const NeverScrollableScrollPhysics();
              });
            }
          }),
          const DirectPage(),
        ],
      ),
    );
  }
}

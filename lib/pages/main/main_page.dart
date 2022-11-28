import 'package:flutter/material.dart';
import 'package:instagram/pages/main/camera_page.dart';
import 'package:instagram/pages/main/direct_page.dart';
import 'package:instagram/pages/main/home_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          CameraPage(),
          HomePage(),
          DirectPage(),
        ],
      ),
    );
  }
}

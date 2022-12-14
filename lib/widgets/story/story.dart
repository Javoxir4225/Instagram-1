import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/models/post_model_image.dart';
import 'package:instagram/widgets/list_tile/list_tile.dart';
import 'package:share_plus/share_plus.dart';
import 'package:story_view/story_view.dart';

class MyStoryPage extends StatefulWidget {
  String? image;
  List<PostModelImage> item;
  MyStoryPage({super.key, required this.image, required this.item});

  @override
  State<MyStoryPage> createState() => _MyStoryPageState();
}

class _MyStoryPageState extends State<MyStoryPage> {
  final controller = StoryController();
  final textController = TextEditingController();
  bool send = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          StoryView(
            storyItems: [
              StoryItem.pageImage(
                url: widget.image!,
                controller: controller,
                imageFit: BoxFit.cover,
              ),
            ],
            controller: controller,
            inline: false,
            repeat: false,
          ),
          Positioned(
            top: 50,
            right: 16,
            left: 20,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: Assets.icons.avatar.provider(),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Name",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28,
                    )),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                // autofocus: true,

                decoration: InputDecoration(
                  hintText: "Send Message",
                  isCollapsed: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  prefixIcon: const Icon(
                    CupertinoIcons.camera_circle_fill,
                    size: 48,
                    color: Colors.grey,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  textController.text = "";
                });
              },
              icon: const Icon(
                CupertinoIcons.paperplane,
                color: Colors.black,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {
                Share.share(widget.image!);
              },
              icon: const Icon(
                Icons.share_outlined,
                color: Colors.black,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

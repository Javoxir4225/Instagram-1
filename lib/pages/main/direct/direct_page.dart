import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/pages/main/direct/mesenger_chat.dart';
import 'package:instagram/servis/db_servise.dart';

class DirectPage extends StatefulWidget {
  PageController controller;
  DirectPage({super.key, required this.controller});

  @override
  State<DirectPage> createState() => _DirectPageState();
}

class _DirectPageState extends State<DirectPage> {
  // String s = "${Random().nextInt(59) + 1}m ago";
  List<PostModel> profile = [];

  void onAdded(PostModel profil) {
    setState(() {
      profile.add(profil);
    });
  }

  @override
  void initState() {
    DBService.getOnAdded(onAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            widget.controller.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: ColorName.black,
            size: 28,
          ),
        ),
        title: const Text(
          "Mesenger",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0
                ? Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        hintText: "Search",
                        prefixIcon: const Icon(CupertinoIcons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  )
                : ListTile(
                    leading: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: profile.isNotEmpty == false
                            ? Assets.icons.avatar.provider()
                            : NetworkImage(profile[profile.length - 1].image!),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          // builder: (context) => const Chernovek(),
                          builder: (context) => MyChat(
                            title: "Name",
                            profiles: profile,
                            s: "${Random().nextInt(59) + 1}m ago",
                          ),
                        ),
                      );
                    },
                    title: const Text("Name"),
                    subtitle: Row(
                      children: [
                        const Text("Fullname"),
                        const Expanded(child: SizedBox()),
                        Text("${Random().nextInt(59) + 1}m ago"),
                      ],
                    ),
                    trailing: IconButton(
                      splashRadius: 24,
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.camera,
                        size: 28,
                      ),
                    ),
                  );
          },
          itemCount: 15),
    );
  }
}

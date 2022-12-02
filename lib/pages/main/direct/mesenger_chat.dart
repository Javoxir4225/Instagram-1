import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:flutter/cupertino.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyChat extends StatefulWidget {
  MyChat(
      {super.key, required this.title, required this.image1, required this.s});
  String? title;
  String? image1;
  String? s;
  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  bool setTextField = true;
  final textController = TextEditingController();
  String textLabel = "";
  List<Masseges> messages = [];

  @override
  void initState() {
    // getList();
    textController.addListener(() {
      if (textController.text.isEmpty) {
        setState(() {
          setTextField = true;
        });
      } else {
        setState(() {
          setTextField = false;
        });
      }
    });
    super.initState();
  }

  // void getList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   messages =  prefs.getStringList("list")??messages;
  // }

  // Future<bool> savedList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList("list", mesengs);
  //   // prefs.clear();
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      foregroundColor: Colors.black,
      title: ListTile(
        leading: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 20,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 18,
              backgroundImage: Assets.icons.avatar.provider(),
            ),
          ),
        ),
        title: Text(
          widget.title.toString(),
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          "online ${widget.s}",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.phone,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.videocam_outlined,
            color: Colors.black,
            size: 28,
          ),
        ),
      ],
    );
  }

  buildBody() {
    return Column(
      children: [
        Expanded(
          child: GroupedListView<Masseges, DateTime>(
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            padding: const EdgeInsets.all(8),
            elements: messages,
            groupBy: (message) => DateTime(
              DateTime.now().month,
              // message.date.year,
              // message.date.month,
              // message.date.day,
            ),
            groupHeaderBuilder: (Masseges message) => const SizedBox(
                // height: 40,
                // child: Card(
                //   color: Colors.blue,
                //   child: Padding(
                //     padding: EdgeInsets.all(8),
                //      child: Text(message.date.day.toString()),
                //   ),
                // ),
                ),
            itemBuilder: (context, Masseges message) => Bubble(
              alignment: message.isAligment
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              nip: message.isAligment
                  ? BubbleNip.rightBottom
                  : BubbleNip.leftTop,
              nipWidth: 16,
              // nipHeight: 20,
              radius: const Radius.circular(20),
              margin: const BubbleEdges.only(top: 10),
              color: message.isAligment
                  ? Colors.green
                  : const Color.fromARGB(255, 28, 90, 139),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.tex,
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(width: 4),
                  message.isAligment
                      ? const Icon(
                          Icons.done_all,
                          color: Colors.white,
                        )
                      : const SizedBox()
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Card(
            //     elevation: 4,
            //     color: Colors.black87,
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            //     child: Padding(
            //       padding: const EdgeInsets.all(12),
            //       child: Text(message.tex,style: const TextStyle(color: Colors.white),),
            //     ),
            //   ),
            // ),
          ),
        ),
        TextField(
          controller: textController,
          onSubmitted: (value) {},
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            hintText: "send a message",
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(
              CupertinoIcons.camera_circle,
              color: Colors.black,
              size: 44,
            ),
            suffixIcon: SizedBox(
              width: 120,
              height: 44,
              child: setTextField == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(CupertinoIcons.mic, color: Colors.black, size: 30),
                        SizedBox(width: 8),
                        Icon(CupertinoIcons.photo,
                            color: Colors.black, size: 30),
                        SizedBox(width: 8),
                        Icon(CupertinoIcons.smiley,
                            color: Colors.black, size: 30),
                        SizedBox(width: 8),
                      ],
                    )
                  : Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            messages.add(Masseges(
                                tex: textController.text, isAligment: true));
                            // savedList();
                            textLabel = textController.text;
                            textController.text = "";
                          });
                          Timer(
                            const Duration(milliseconds: 1000),
                            () {
                              setState(() {
                                messages.add(Masseges(
                                    tex: textLabel, isAligment: false));
                              });
                            },
                          );
                        },
                        child: const Text(
                          "Send",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
            ),
            fillColor: Colors.grey.shade400,
            filled: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                borderSide: BorderSide.none),
          ),
        )
      ],
    );
  }
}

class Masseges {
  final String tex;
  final bool isAligment;
  // final DateTime date;
  Masseges({required this.tex, required this.isAligment});
}

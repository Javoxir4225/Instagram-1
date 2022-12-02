import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/widgets/comentary/comentary.dart';
import 'package:instagram/widgets/list_tile/list_tile.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

class PostItem extends StatefulWidget {
  final String? caption;
  final String? image;
  PostItem({this.image, this.caption, super.key});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool liked = true;
  bool liked1 = true;
  int onTap = 0;
  bool send = true;
  bool send1 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Assets.icons.avatar.image(
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorName.black,
                    ),
                  ),
                  Text(
                    "November 28, 2022",
                    style: TextStyle(
                      fontSize: 12,
                      color: ColorName.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {
                Share.share(widget.image ?? "");
              },
              icon: const Icon(
                Icons.share_outlined,
              ),
              splashRadius: 16,
            ),
          ],
        ),
        const SizedBox(height: 6),
        widget.image == null
            ? GestureDetector(
                onTap: () {
                   setState(() {
                    onTap++;
                    Timer(
                      const Duration(milliseconds: 500),
                      () {
                        setState(() {
                          onTap = 0;
                        });
                      },
                    );
                    if (onTap == 2) {
                      if (liked) {
                        liked = !liked;
                      }
                      onTap = 0;
                      liked1 = false;
                      Timer(
                        const Duration(milliseconds: 1000),
                        () {
                          setState(() {
                            liked1 = true;
                          });
                        },
                      );
                    }
                  });
                },
                child: Assets.images.placeholder.image(
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    onTap++;
                    Timer(
                      const Duration(milliseconds: 500),
                      () {
                        setState(() {
                          onTap = 0;
                        });
                      },
                    );
                    if (onTap == 2) {
                      if (liked) {
                        liked = !liked;
                      }
                      onTap = 0;
                      liked1 = false;
                      Timer(
                        const Duration(milliseconds: 1000),
                        () {
                          setState(() {
                            liked1 = true;
                          });
                        },
                      );
                    }
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.image!,
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                    liked1
                        ? const SizedBox()
                        : Lottie.asset("assets/lottie/like_button.json"),
                  ],
                ),
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              LikeButton(
                size: 26,
                isLiked: liked ? false : true,
                onTap: (isLiked) async {
                  setState(() {
                    liked = !liked;
                  });
                },
              ),
              IconButton(
                onPressed: () {},
                constraints: const BoxConstraints(maxHeight: 36, maxWidth: 36),
                splashRadius: 16,
                iconSize: 24,
                icon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) =>  Comentary(),
                      ),
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.chat_bubble,
                    color: ColorName.black,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  buildShowModilButton();
                },
                constraints: const BoxConstraints(maxHeight: 36, maxWidth: 36),
                splashRadius: 16,
                icon: const Icon(
                  CupertinoIcons.paperplane,
                  color: ColorName.black,
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                splashRadius: 16,
                alignment: Alignment.centerRight,
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bookmark),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Liked by ",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                TextSpan(
                  text: "Sigmund, Yessenia, Dayana ",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                TextSpan(
                  text: "and ",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                TextSpan(
                  text: "1263 others ",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                TextSpan(
                  text: "Brianne ",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                TextSpan(
                  text: "consequantur nihil aliqiud omnis consequantor ",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                TextSpan(
                  text: "Febuary 2020",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
              ],
            ),
          ),
          // child: Text(caption ?? "No caption!"),
        ),
      ],
    );
  }

  buildShowModilButton() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.6,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.horizontal_rule_sharp,
                size: 36,
              ),
              Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "Search",
                    prefixIcon: const Icon(CupertinoIcons.search),
                    fillColor: Colors.grey.shade400,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (context, index) => BuildListTile(
                    send: send,
                  ),
                  itemCount: 15,
                ),
              ),
            ],
          ),
        ),
        //   bottomSheet: send1
        //       ? null
        //       : ElevatedButton(
        //           onPressed: () {

        //           },
        //           style: ElevatedButton.styleFrom(
        //             fixedSize: const Size(double.maxFinite, 48),
        //           ),
        //           child: Text("Ready"),
        //         ),
        // ),
      ),
    );
  }
}

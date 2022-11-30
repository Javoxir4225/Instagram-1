import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:like_button/like_button.dart';

class PostItem extends StatefulWidget {
  final String? caption;
  final String? image;
  PostItem({this.image, this.caption, super.key});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool liked = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Assets.icons.avatar.image(
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorName.black,
                    ),
                  ),
                  Text(
                    "November 28, 2022",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorName.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
              ),
              splashRadius: 16,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        widget.image == null
            ? Assets.images.placeholder.image(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: widget.image!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const LikeButton(
                size: 26,
              ),
              // IconButton(
              //   onPressed: () {
              //     setState(() {
              //       liked != liked;
              //       print('liked = $liked');
              //     });
              //   },
              //   constraints: const BoxConstraints(maxHeight: 36, maxWidth: 36),
              //   splashRadius: 16,
              //   iconSize: 24,
              //   icon: liked == true
              //       ? const Icon(
              //           Icons.favorite_border,
              //           color: Colors.black,
              //         )
              //       : const Icon(
              //           Icons.favorite,
              //           color: Colors.red,
              //         ),
              // ),
              IconButton(
                onPressed: () {},
                constraints: const BoxConstraints(maxHeight: 36, maxWidth: 36),
                splashRadius: 16,
                iconSize: 24,
                icon: const Icon(
                  Icons.message_outlined,
                  color: ColorName.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                constraints: const BoxConstraints(maxHeight: 36, maxWidth: 36),
                splashRadius: 16,
                icon: const Icon(
                  Icons.near_me,
                  color: ColorName.black,
                ),
              ),
              const SizedBox(width: 220),
              IconButton(
                splashRadius: 16,
                alignment: Alignment.centerRight,
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border_outlined),
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
}

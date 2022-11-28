import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/gen/colors.gen.dart';

class PostItem extends StatelessWidget {
  final String? caption;
  final String? image;
  const PostItem({this.image, this.caption, super.key});

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
          height: 20,
        ),
        image == null
            ? Assets.images.placeholder.image(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: image!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              constraints: const BoxConstraints(maxHeight: 36, maxWidth: 36),
              splashRadius: 16,
              iconSize: 24,
              icon: const Icon(
                Icons.favorite_outline,
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
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(caption ?? "No caption!"),
        ),
      ],
    );
  }
}

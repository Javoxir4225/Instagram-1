import 'package:flutter/material.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/gen/fonts.gen.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/widgets/post/post_item.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  final items = [
    const PostModel(
        photo:
            "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
        caption: "This is a nature!"),
    const PostModel(
        photo:
            "http://cdn.playbuzz.com/cdn/925704be-9b8e-4dfc-852e-f24d720cb9c5/bcf39e88-5731-43bb-9d4b-e5b3b2b1fdf2.jpg",
        caption: "This is a nature!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            height: 33,
          );
        },
        itemBuilder: (context, index) {
          final post = items[index];
          return PostItem(
            caption: post.caption,
            image: post.photo,
          );
        },
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(),
      ),
      title: const Text(
        "Instagram",
        style: TextStyle(
          fontFamily: FontFamily.billabong,
          color: ColorName.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 16,
          icon: const Icon(
            Icons.camera_alt,
            color: ColorName.black,
          ),
        ),
      ],
    );
  }
}

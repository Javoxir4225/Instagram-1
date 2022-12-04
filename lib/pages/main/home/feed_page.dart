import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/gen/fonts.gen.dart';
import 'package:instagram/models/post_model_image.dart';
import 'package:instagram/widgets/post/post_item.dart';
import 'package:instagram/widgets/story/story.dart';

class FeedPage extends StatefulWidget {
  PageController controller;
  FeedPage({super.key, required this.controller});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final items = [
    const PostModelImage(
        photo:
            "https://www.roberthalf.com/sites/default/files/2018-02/New%20York%20City%20Hiring%20Index.jpg",
        caption: "This is a nature!"),
    const PostModelImage(
        photo:
            "https://i.pinimg.com/originals/13/37/5a/13375a62ea6c3f50f3aeeab5b5479220.jpg",
        caption: "This is a nature!"),
    const PostModelImage(
        photo:
            "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
        caption: "This is a nature!"),
    const PostModelImage(
        photo:
            "http://cdn.playbuzz.com/cdn/925704be-9b8e-4dfc-852e-f24d720cb9c5/bcf39e88-5731-43bb-9d4b-e5b3b2b1fdf2.jpg",
        caption: "This is a nature!"),
    const PostModelImage(
        photo: "https://www.echoru.com/image/catalog/news/005043.png",
        caption: "This is a nature!"),
    const PostModelImage(
        photo: "https://storge.pic2.me/cm/5120x2880/175/5a68f04b9d5ee.jpg",
        caption: "This is a nature!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.separated(
        itemCount: items.length + 1,
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            height: 33,
          );
        },
        itemBuilder: (context, index) => index == 0
            ? Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) =>
                              MyStoryPage(image: items[index].photo,item: items),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.pink,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                NetworkImage(items[index].photo ?? ""),
                          ),
                        ),
                        const Text("Username",
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 12,
                  ),
                  itemCount: items.length,
                ),
              )
            : PostItem(
                caption: items[index - 1].caption,
                image: items[index - 1].photo,
              ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
        splashRadius: 18,
        icon: const Icon(
          CupertinoIcons.camera,
          color: Colors.black,
          size: 28,
        ),
        onPressed: () {
          widget.controller.previousPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
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
          fontSize: 32,
          fontFamily: FontFamily.billabong,
          color: ColorName.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 24,
          icon: const Icon(
            CupertinoIcons.play_rectangle,
            size: 28,
            color: ColorName.black,
          ),
        ),
        IconButton(
          onPressed: () {
            widget.controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          splashRadius: 16,
          icon: const Icon(
            CupertinoIcons.paperplane,
            size: 28,
            color: ColorName.black,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/models/post_model_image.dart';
import 'package:instagram/pages/main/home/profile/search/search_profile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final items = [
    const PostModelImage(
      photo:
          "https://www.roberthalf.com/sites/default/files/2018-02/New%20York%20City%20Hiring%20Index.jpg",
    ),
    const PostModelImage(
      photo:
          "https://i.pinimg.com/originals/13/37/5a/13375a62ea6c3f50f3aeeab5b5479220.jpg",
    ),
    const PostModelImage(
      photo:
          "https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg",
    ),
    const PostModelImage(
      photo:
          "http://cdn.playbuzz.com/cdn/925704be-9b8e-4dfc-852e-f24d720cb9c5/bcf39e88-5731-43bb-9d4b-e5b3b2b1fdf2.jpg",
    ),
    const PostModelImage(
      photo: "https://www.echoru.com/image/catalog/news/005043.png",
    ),
    const PostModelImage(
      photo:
          "https://sun9-25.userapi.com/impg/zwBoX8Jta7NDiy1zblYE-kKn6EKKyP_j6lnkvA/8VchNd7aZwU.jpg?size=604x345&quality=96&sign=e0cd5fd21306dcc82afa3e7381be8c6b&type=album",
    ),
    const PostModelImage(
      photo: "https://storge.pic2.me/cm/5120x2880/175/5a68f04b9d5ee.jpg",
    ),
    const PostModelImage(
      photo:
          "https://img1.goodfon.ru/original/1152x864/4/bb/rys-koshka-koryaga-profil.jpg",
    ),
    const PostModelImage(
      photo:
          "https://cs13.pikabu.ru/post_img/big/2021/01/09/0/1610142056234543603.png",
    ),
    const PostModelImage(
      photo: "https://storge.pic2.me/cm/5120x2880/175/5a68f04b9d5ee.jpg",
    ),
    const PostModelImage(
      photo: "https://storyfox.ru/wp-content/uploads/2016/03/143.jpg",
    ),
    const PostModelImage(
      photo:
          "https://img-fotki.yandex.ru/get/6812/30348152.1a3/0_83472_40b67e2_orig",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => SearchProfile(),
              ),
            );
          },
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              fillColor: Colors.grey.shade300,
              filled: true),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 28,
          icon: Icon(
            Icons.camera_alt_rounded,
            color: Colors.grey.shade800,
            size: 32,
          ),
        ),
      ],
      bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _tagItem(" IGTV", iconData: Icons.live_tv),
                const SizedBox(width: 10),
                _tagItem(" Shop", iconData: Icons.shopping_bag),
                const SizedBox(width: 10),
                _tagItem("Style"),
                const SizedBox(width: 10),
                _tagItem("Sports"),
                const SizedBox(width: 10),
                _tagItem("Auto"),
              ],
            ),
          )),
    );
  }

  buildBody() {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.same,
        pattern: List.generate(18, (index) {
          int ind = index % 18;
          if (ind == 1 || ind == 9) {
            return const QuiltedGridTile(2, 2);
          }
          return const QuiltedGridTile(1, 1);
        }),
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) => Image(
            image: NetworkImage(
              items[index].photo!,
            ),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _tagItem(String title, {IconData? iconData}) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconData == null
              ? const SizedBox()
              : Icon(
                  iconData,
                  color: Colors.black,
                ),
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  // buildBody() {
  //   return ListView(
  //       children: List.generate(20, (index) {
  //     return ListTile(
  //       leading: Container(
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           border: Border.all(width: 2.5, color: ColorName.purpleRed),
  //         ),
  //         child: Container(
  //           margin: const EdgeInsets.all(1.5),
  //           child: ClipRRect(
  //               borderRadius: BorderRadius.circular(100),
  //               child: Assets.icons.avatar.image()),
  //         ),
  //       ),
  //       subtitle: const Text('yodgorovsh03@mail.ru'),
  //       title: const Text('Sherali Yodgorov'),
  //       trailing: OutlinedButton(
  //         style: OutlinedButton.styleFrom(
  //             fixedSize: const Size(double.infinity, 28)),
  //         child: const Text('Follow'),
  //         onPressed: () {},
  //       ),
  //     );
  //   },),);
  // }
}

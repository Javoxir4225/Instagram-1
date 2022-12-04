import 'dart:io';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/pages/main/home/profile/edit_profile.dart';
import 'package:instagram/servis/db_servise.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  File? image;
  TabController? _tabController;
  final PageController _pagecontroller = PageController();
  List<PostModel> profile = [];

  void onPostAdded(PostModel post) {
    setState(() {
      profile.add(post);
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      _pagecontroller.animateToPage(_tabController?.index ?? 0,
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.ease);
    });
    DBService.getOnAdded(onPostAdded);
    print("++++++++++++++++++++++++++++++++++++++++++++");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
      endDrawer: Drawer(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            const Text(
              "  Profily Name..........",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            buildTextbottonIcon(Icons.replay_rounded, "Archive"),
            buildTextbottonIcon(
                Icons.history_toggle_off_outlined, "Your Activity"),
            buildTextbottonIcon(CupertinoIcons.qrcode_viewfinder, "Nametag"),
            buildTextbottonIcon(CupertinoIcons.bookmark, "Saved"),
            buildTextbottonIcon(
                Icons.format_list_bulleted_outlined, "Close Friends"),
            buildTextbottonIcon(
                CupertinoIcons.person_badge_plus_fill, "Discover People"),
            buildTextbottonIcon(Icons.facebook, "Open Facebook"),
            const Expanded(child: SizedBox()),
            const Expanded(child: SizedBox()),
            buildTextbottonIcon(CupertinoIcons.settings, "Settings"),
          ],
        ),
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 110,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.5, color: Colors.black26),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: profile.isNotEmpty==true? profile[0].image == null
                            ? Assets.icons.avatar.image(width: 80, height: 80)
                            : Image.network(profile[profile.length-1].image!,fit: BoxFit.cover,):Assets.icons.avatar.image(),
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                buildTop(label: '54', text: 'Posts'),
                const Expanded(child: SizedBox()),
                buildTop(label: '834', text: 'Followers'),
                const Expanded(child: SizedBox()),
                buildTop(label: '204', text: 'Following'),
              ],
            ),
          ),
          const SizedBox(height: 6),
           const Text(
            'Sherali Yodgorov',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Programmer,  Enterpreneur',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 36)),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => EditProfile(),
                ),
              );
            },
            child: const Text(
              'Edit Profile',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              buildStory(
                  image: Assets.images.placeholder
                      .image(width: 60, height: 60, fit: BoxFit.cover),
                  label: 'Add'),
              const SizedBox(width: 12),
              buildStory(
                  image: Assets.images.friends
                      .image(width: 60, height: 60, fit: BoxFit.cover),
                  label: 'Friends'),
              const SizedBox(width: 12),
              buildStory(
                  image: Assets.images.family
                      .image(width: 60, height: 60, fit: BoxFit.cover),
                  label: 'Family'),
              const SizedBox(width: 12),
            ],
          ),
          TabBar(
            isScrollable: false,
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.list_alt,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.grid_view_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          ExpandablePageView(
            // controller: _tabController,
            controller: _pagecontroller,
            onPageChanged: (value) {
              _tabController?.animateTo(value,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.ease);
            },
            children: [
              gridViewBuild(),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.deepOrange,
              )
            ],
          )
        ],
      ),
    );
  }

  buildTop({label, text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  buildAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Profile',
        style: TextStyle(
          fontFamily: 'Billabong',
          color: Colors.black,
          fontSize: 28,
        ),
      ),
    );
  }

  buildStory({image, label}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.5, color: Colors.black26),
          ),
          child: Container(
            margin: const EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: image,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(),
        ),
      ],
    );
  }

  void pickImage() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result != null) {
      image = File(result.path);
    } else {
      print("CreatePostPage:pickImage: error => didn't find image");
    }
    setState(() {});
  }

  gridViewBuild() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.count(
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(
              10,
              (index) => Container(
                    child: Assets.images.family
                        .image(height: 40, width: 40, fit: BoxFit.cover),
                  )),
        ),
      ],
    );
  }

  buildTextbottonIcon(IconData icon, String s) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.black,
        size: 28,
      ),
      label: Text(
        s,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}

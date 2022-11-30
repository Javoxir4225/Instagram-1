import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/gen/colors.gen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
    );
  }

  buildBody() {
    return ListView(
        children: List.generate(20, (index) {
      return ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.5, color: ColorName.purpleRed),
          ),
          child: Container(
            margin: const EdgeInsets.all(1.5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Assets.icons.avatar.image()),
          ),
        ),
        subtitle: const Text('yodgorovsh03@mail.ru'),
        title: const Text('Sherali Yodgorov'),
        trailing: OutlinedButton(
          style: OutlinedButton.styleFrom(
              fixedSize: const Size(double.infinity, 28)),
          child: const Text('Follow'),
          onPressed: () {},
        ),
      );
    }));
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Search',
        style: TextStyle(
            fontSize: 32, fontFamily: 'Billabong', color: Colors.black),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                hintText: 'Search',
                fillColor: Colors.grey.shade200,
                filled: true),
          ),
        ),
      ),
    );
  }
}

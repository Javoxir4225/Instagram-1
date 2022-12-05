
import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/gen/colors.gen.dart';

class SearchProfile extends StatefulWidget {
  const SearchProfile({super.key});

  @override
  State<SearchProfile> createState() => _SearchProfileState();
}

class _SearchProfileState extends State<SearchProfile> {
  final textController = TextEditingController();
  bool send = true;
  @override
  void initState() {
    textController.addListener(() {
      if (textController.text.isNotEmpty) {
        setState(() {
          send = false;
        });
      }
      else{
        setState(() {
          send = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
       
        title: TextField(
        controller: textController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Search",
          // suffixText: "Send",
          
          // suffixStyle: TextStyle(
          //     color: send ? Colors.blueGrey : Colors.blue, fontSize: 20,fontWeight: FontWeight.bold),
          prefixIcon: const Icon(Icons.search),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          fillColor: Colors.grey.shade300,
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        ),
      ),),
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
    },),);
  }

}

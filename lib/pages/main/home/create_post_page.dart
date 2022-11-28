import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/gen/fonts.gen.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            height: 400,
            child: image == null
                ? GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey.shade500,
                      size: 56,
                    ),
                  )
                : Image.file(
                    image!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              maxLines: 100,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Caption",
              ),
            ),
          ),
        ],
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
      title: const Text(
        "Upload",
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
            Icons.post_add,
            color: ColorName.purpleRed,
          ),
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
}

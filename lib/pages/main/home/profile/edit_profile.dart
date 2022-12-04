// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/gen/assets.gen.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/servis/db_servise.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  bool isImage = true;
  List<PostModel> profile = [];

  void onProfileAdded(PostModel post) {
    setState(() {
      profile.add(post);
    });
  }

  @override
  void initState() {
    DBService.getOnAdded(onProfileAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 103, 159),
        title: const Text("Edit Profile"),
        centerTitle: true,
        actions: [
          Center(
            child: TextButton(
              onPressed:isImage == false? () async{
                  final post = PostModel(
                  id: DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()),
                  fullname: "Salohiddin");
              final res = await DBService.createProfile(post, image);
           
              }:null,
              child: Text(
                "Done",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                final result =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (result != null) {
                  setState(() {
                    image = File(result.path);
                    isImage = false;
                  });
                }
              },
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      width: 500,
                      child: Lottie.asset(
                        "assets/lottie/moving_bubbles.json",
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Lottie.asset(
                        "assets/lottie/avatar_blue.json",
                      ),
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: profile.isNotEmpty == false
                          ? Assets.icons.avatar.provider()
                          : isImage == true
                              ? NetworkImage(profile[profile.length - 1].image!)
                              : FileImage(image!) as ImageProvider,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Change Profile Photo",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 8),
            Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText("Name"),
                      SizedBox(height: 8),
                      Divider(thickness: 1, color: Colors.white),
                      buildText("Username"),
                      SizedBox(height: 8),
                      Divider(thickness: 1, color: Colors.white),
                      buildText("Website"),
                      SizedBox(height: 8),
                      Divider(thickness: 1, color: Colors.white),
                      buildText("Bio"),
                    ],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText("Jacob West"),
                        SizedBox(height: 8),
                        Divider(thickness: 1, color: Colors.grey.shade400),
                        buildText("jacob_w"),
                        SizedBox(height: 8),
                        Divider(thickness: 1, color: Colors.grey.shade400),
                        buildText("Websita"),
                        SizedBox(height: 8),
                        Divider(thickness: 1, color: Colors.grey.shade400),
                        Text(
                          "Digital goodies disinger @pixsellz Everything is disigned.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Colors.grey.shade400),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Switch to Profissional Account",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Private Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText("Email"),
                          SizedBox(height: 8),
                          Divider(thickness: 1, color: Colors.white),
                          buildText("Phone"),
                          SizedBox(height: 8),
                          Divider(thickness: 1, color: Colors.white),
                          buildText("Gender"),
                        ],
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildText("jacob.west@gmail.com"),
                            SizedBox(height: 8),
                            Divider(thickness: 1, color: Colors.grey.shade400),
                            buildText("+99 205 4225"),
                            SizedBox(height: 8),
                            Divider(thickness: 1, color: Colors.grey.shade400),
                            buildText("Male"),
                            SizedBox(height: 8),
                            Divider(thickness: 1, color: Colors.grey.shade400),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildText(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

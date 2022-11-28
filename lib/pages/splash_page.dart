import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/gen/fonts.gen.dart';
import 'package:instagram/pages/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        milliseconds: 1500,
      ),
    ).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) {
          return  LoginPage();
        },
      ),);
    });

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorName.purpleRed, ColorName.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: const [
            Expanded(
                child: Center(
              child: Text(
                "Instagram",
                style: TextStyle(
                  fontSize: 45,
                  color: ColorName.white,
                  fontFamily: FontFamily.billabong,
                ),
              ),
            ),),
            Text(
              "All rights reserved",
              style: TextStyle(
                fontSize: 16,
                color: ColorName.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

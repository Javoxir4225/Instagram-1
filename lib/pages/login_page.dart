import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/pages/main/main_page.dart';
import 'package:instagram/pages/sign_up_page.dart';
import 'package:instagram/widgets/text_fields/login_text_field.dart';

import '../gen/fonts.gen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formState = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          children: [
            Expanded(
              child: Form(
                key: formState,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Instagram",
                      style: TextStyle(
                        fontSize: 45,
                        color: ColorName.white,
                        fontFamily: FontFamily.billabong,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextfield(
                      hint: "Email",
                      controller: emailCtrl,
                      validator: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextfield(
                      hint: "Password",
                      isObsecure: true,
                      controller: passwordCtrl,
                      validator: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) {
                              return MainPage();
                            },
                          ),);
                        },
                        style: OutlinedButton.styleFrom(
                            foregroundColor: ColorName.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                6,
                              ),
                            ),
                            side: const BorderSide(
                                color: ColorName.white, width: 1)),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorName.white,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorName.white,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return SignUpPage();
                              },
                            ),
                          );
                        },
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorName.white,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

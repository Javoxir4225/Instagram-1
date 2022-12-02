import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/colors.gen.dart';
import 'package:instagram/gen/fonts.gen.dart';
import 'package:instagram/pages/login_page.dart';
import 'package:instagram/pages/main/main_page.dart';
import 'package:instagram/widgets/text_fields/login_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final formState = GlobalKey<FormState>();
  final fullnamelCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final confirmpasswordCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  int sum = 0;
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
                      hint: "Fullname",
                      controller: fullnamelCtrl,
                      validator: (value) {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    LoginTextfield(
                      hint: "Email",
                      controller: emailCtrl,
                      validator: (value) {
                        if (value?.isNotEmpty == true) {
                          if (value?.contains("@") == false) {
                            return "Error";
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    LoginTextfield(
                      hint: "Password",
                      isObsecure: true,
                      controller: passwordCtrl,
                      validator: (value) {
                        if (value?.isNotEmpty == true) {
                          if (value![0].codeUnits[0] >= 65 &&
                              value[0].codeUnits[0] <= 90) {
                          } else {
                            return "Error";
                          }
                        }
                        if (value?.isNotEmpty == true) {
                          if (value?.contains("!") == false) {
                            return "Error";
                          }
                        }
                        if (value?.isNotEmpty == true) {
                          for (var i = 0; i < value!.length; i++) {
                            if (int.tryParse(value[i]) != null) {
                              sum++;
                            }
                          }
                          if (sum >= 3) {
                            // return "";
                          } else {
                            return "Error";
                          }
                        } else {
                          sum = 0;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    LoginTextfield(
                      hint: "Confirim Password",
                      isObsecure: true,
                      controller: confirmpasswordCtrl,
                      validator: (value) {
                        if (value?.isNotEmpty == true) {
                          if (value != passwordCtrl.text) {
                            return "Error";
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          if (emailCtrl.text.isNotEmpty &&
                              passwordCtrl.text.isNotEmpty &&
                              fullnamelCtrl.text.isNotEmpty &&
                              confirmpasswordCtrl.text.isNotEmpty) {
                            Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          }
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
                          "Sign up",
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
                  text: "Already have an account?  ",
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorName.white,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(
                            CupertinoPageRoute(
                              builder: (context) => LoginPage(),
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

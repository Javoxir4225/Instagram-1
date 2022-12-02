import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';

class Comentary extends StatefulWidget {
  Comentary({super.key});

  @override
  State<Comentary> createState() => _ComentaryState();
}

class _ComentaryState extends State<Comentary> {
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
        title: const Text("Comentary"),
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                splashRadius: 24,
                icon: const Icon(
                  CupertinoIcons.paperplane,
                  size: 28,
                )),
          )
        ],
      ),
      bottomSheet: TextField(
        controller: textController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Add comment.....",
          suffixText: "Send",
          
          suffixStyle: TextStyle(
              color: send ? Colors.blueGrey : Colors.blue, fontSize: 20,fontWeight: FontWeight.bold),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                CircleAvatar(backgroundImage: Assets.icons.avatar.provider()),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          fillColor: Colors.grey.shade300,
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        ),
      ),
    );
  }
}

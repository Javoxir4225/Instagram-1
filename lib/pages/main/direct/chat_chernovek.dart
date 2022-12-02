import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class Chernovek extends StatefulWidget {
  const Chernovek({super.key});

  @override
  State<Chernovek> createState() => _ChernovekState();
}

class _ChernovekState extends State<Chernovek> {
  List<Massege> messages = [
    Massege(tex: ""
    ),
  
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Massege, DateTime>(
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                padding: const EdgeInsets.all(8),
                elements: messages,
                groupBy: (message) => DateTime(
                  DateTime.now().month,
                      // message.date.year,
                      // message.date.month,
                      // message.date.day,
                    ),
                groupHeaderBuilder: (Massege message) => const SizedBox(
                    // height: 40,
                    // child: Card(
                    //   color: Colors.blue,
                    //   child: Padding(
                    //     padding: EdgeInsets.all(8),
                    //      child: Text(message.date.day.toString()),
                    //   ),
                    // ),
                    ),
                itemBuilder: (context, Massege message) => Bubble(
                      alignment: Alignment.centerRight,
                      nip: BubbleNip.rightTop,
                      nipWidth: 16,
                      // nipHeight: 30,
                      radius: const Radius.circular(20),
                      margin: const BubbleEdges.only(top: 10),
                      color: const Color.fromARGB(255, 40, 36, 36),
                      child: Text(
                        message.tex,
                        textAlign: TextAlign.right,
                        style: const TextStyle(color: Colors.white,fontSize: 16),
                      ),
                    )
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Card(
                //     elevation: 4,
                //     color: Colors.black87,
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(12),
                //       child: Text(message.tex,style: const TextStyle(color: Colors.white),),
                //     ),
                //   ),
                // ),
                ),
          ),
          Container(
            color: Colors.grey.shade300,
            child: TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: "Type your massega here...",
              ),
              onSubmitted: (value) {
                final message = Massege(tex: value, );
                setState(() {
                  messages.add(message);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class Massege {
  final String tex;
  // final DateTime date;

  Massege({required this.tex,});
}

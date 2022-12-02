import 'package:flutter/material.dart';
import 'package:instagram/gen/assets.gen.dart';

class BuildListTile extends StatefulWidget {
  bool send;
  BuildListTile({super.key, required this.send});

  @override
  State<BuildListTile> createState() => _BuildListTileState();
}

class _BuildListTileState extends State<BuildListTile> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => ListTile(
        leading: CircleAvatar(
          radius: 36,
          backgroundColor: Colors.green,
          child: CircleAvatar(
            radius: 25,
            backgroundImage: Assets.icons.avatar.provider(),
          ),
        ),
        onTap: () {},
        title: const Text("Name"),
        subtitle: const Text("Fullname"),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              widget.send = !widget.send;
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 1,
            fixedSize: const Size(120, 30),
            backgroundColor: widget.send ? Colors.blue : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: widget.send ? const Text("Send") : const Text("Cancel"),
        ),
      ),
    );
  }
}

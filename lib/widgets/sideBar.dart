
import 'package:flutter/material.dart';

class rDrawer extends StatelessWidget {
  const rDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 360),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        //color: Colors.white,
        width: 195,
        height: 339,
        child: const Column(
          children: [
            Text("hellooo")
          ],
        ),
      ),
    );
  }
}

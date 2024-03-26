import 'package:flutter/material.dart';
import 'package:unimate/resources/authentication.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: InkWell(
          onTap: () {
            logOut(context);
          },
          child: Text("Go Back")),
    )));
  }
}

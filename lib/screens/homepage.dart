import 'package:flutter/material.dart';

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
          body:Center(
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Text("Go Back")),

          )
        )
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources/authentication.dart';

class Appbar extends StatelessWidget implements PreferredSize {
  const Appbar({super.key, required this.leading});
  final leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent, //Color.fromRGBO(245, 237, 232, 1),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: leading,
        title: const Text(
          'UniMate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color.fromRGBO(138, 94, 65, 1),
          ),
        ),
        leading: leading?GestureDetector(
          onTap: (){
            if(leading){
              Navigator.pop(context);
            }
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded, color: Color.fromRGBO(138, 94, 65, 1)),
        ):null,
        actions: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: CircleAvatar(
              foregroundImage:
                  NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => const SizedBox();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 60);
}

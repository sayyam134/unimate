import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:unimate/resources/authentication.dart';

class rDrawer extends StatelessWidget {
  const rDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 270),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromRGBO(138, 94, 65, 1), width: 5),
        ),
        width: 205,
        height: 339,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Aliasgar Kuwakhedawala",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4,),
                const Text("sayyam134@gmail.com",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black
                ),
                ),
                const SizedBox(height: 10,),
                const Divider(thickness: 3,),
                const SizedBox(height: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){

                        final snack = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                          title: 'Coming Soon',
                          message: 'This Service will be available Shortly.\nSorry for the inconvenience',
                          contentType: ContentType.warning,

                        ),);
                        Scaffold.of(context).closeEndDrawer();
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snack);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.file_download, size: 25,),
                          SizedBox(width: 10),
                          Text("Download", style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: (){

                        final snack = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Coming Soon',
                            message: 'This Service will be available Shortly.\nSorry for the inconvenience',
                            contentType: ContentType.warning,

                          ),);
                        Scaffold.of(context).closeEndDrawer();
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snack);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.settings, size: 25,),
                          SizedBox(width: 10),
                          Text("Settings", style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: (){

                        final snack = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Coming Soon',
                            message: 'This Service will be available Shortly.\nSorry for the inconvenience',
                            contentType: ContentType.warning,

                          ),);
                        Scaffold.of(context).closeEndDrawer();
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snack);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.help_outline_rounded, size: 25,),
                          SizedBox(width: 10),
                          Text("Help/Support", style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: ()async{
                        await logOut(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.logout, size: 25,),
                          SizedBox(width: 10),
                          Text("Logout", style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

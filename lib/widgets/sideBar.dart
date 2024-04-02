import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unimate/resources/authentication.dart';
import 'package:url_launcher/link.dart';

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
                  Text(FirebaseAuth.instance.currentUser!.displayName.toString(),
                   style: const TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                   ),
                   textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 4,),
                 Text(FirebaseAuth.instance.currentUser!.email.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black
                ),
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
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
                    Link(
                      target: LinkTarget.self,
                      uri: Uri.parse("https://www.termsfeed.com/live/f355bbee-79ee-4228-b5c0-9ec75a890ed6"),
                      builder: (BuildContext context, followLink)=> InkWell(
                        onTap: followLink,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.privacy_tip_outlined, size: 25,),
                            SizedBox(width: 10),
                            Text("Privacy Policy", style: TextStyle(fontSize: 20),)
                          ],
                        ),
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


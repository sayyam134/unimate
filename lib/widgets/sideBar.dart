import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/link.dart';

import '../resources/authentication.dart';

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
          border:
              Border.all(color: const Color.fromRGBO(138, 94, 65, 1), width: 5),
        ),
        width: (MediaQuery.of(context).size.width*0.6),
        height: (MediaQuery.of(context).size.height*0.55),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  FirebaseAuth.instance.currentUser!.displayName.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  FirebaseAuth.instance.currentUser!.email.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        final snack = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Coming Soon',
                            message:
                                'This Service will be available Shortly.\nSorry for the inconvenience',
                            contentType: ContentType.warning,
                          ),
                        );
                        Scaffold.of(context).closeEndDrawer();
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snack);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.file_download,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Download",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        final snack = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Coming Soon',
                            message:
                                'This Service will be available Shortly.\nSorry for the inconvenience',
                            contentType: ContentType.warning,
                          ),
                        );
                        Scaffold.of(context).closeEndDrawer();
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snack);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.settings,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Settings",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        final snack = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Coming Soon',
                            message:
                                'This Service will be available Shortly.\nSorry for the inconvenience',
                            contentType: ContentType.warning,
                          ),
                        );
                        Scaffold.of(context).closeEndDrawer();
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snack);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.help_outline_rounded,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Help/Support",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Link(
                      target: LinkTarget.self,
                      uri: Uri.parse(
                          "https://www.termsfeed.com/live/f355bbee-79ee-4228-b5c0-9ec75a890ed6"),
                      builder: (BuildContext context, followLink) => InkWell(
                        onTap: followLink,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.privacy_tip_outlined,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        await logOut(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.logout,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Logout",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        final _dialog = RatingDialog(
                          initialRating: 3.0,
                          title: const Text(
                            'UniMate',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // encourage your user to leave a high rating?
                          message: const Text(
                            'Tap a star to set your rating. Add more description here if you want.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          // your app's logo?
                          image: Image.asset("assests/icon/icon.png", width: 100, height: 100,),
                          submitButtonText: 'Submit',
                          commentHint: 'Provide your valuable feedback.',
                          onCancelled: () => print('cancelled'),
                          onSubmitted: (response) {
                            print('rating: ${response.rating}, comment: ${response.comment}');

                            // TODO: add your own logic
                            if (response.rating < 3.0) {
                              // send their comments to your email or anywhere you wish
                              // ask the user to contact you instead of leaving a bad review
                            } else {
                              StoreRedirect.redirect(androidAppId: "com.ashtaheadline.unimate");
                            }
                          },
                        );
                        // show the dialog
                        showDialog(
                          context: context,
                          barrierDismissible: true, // set to false if you want to force a rating
                          builder: (context) => _dialog,
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.star,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Rate The App",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Share.share("https://play.google.com/store/apps/details?id=com.ashtaheadline.unimate", subject: "Checkout the amazing Unimate App");
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.share_outlined,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Share Us",
                            style: TextStyle(fontSize: 20),
                          )
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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:unimate/screens/pdf_viewer_screen.dart';
import 'package:unimate/widgets/appBar.dart';

import '../widgets/grid_item.dart';
import '../widgets/sideBar.dart';

final _firestore = FirebaseFirestore.instance;

class NoteScreen extends StatefulWidget {
  const NoteScreen(
      {super.key,
      required this.yearId,
      required this.subjectId,
      required this.unitId});
  final String yearId;
  final String subjectId;
  final String unitId;

  @override
  State<NoteScreen> createState() {
    // TODO: implement createState
    return _NoteScreenState();
  }
}

class _NoteScreenState extends State<NoteScreen> {
  var noteList = [];
  // var imageurl;
  Future<void> getNotes() async {
    try {
      final userId = await FirebaseAuth.instance.currentUser!.uid;
      var response = await _firestore.collection('users').doc(userId).get();
      final user = response.data();
      final data = await _firestore
          .collection('institute')
          .doc(user!['instituteId'])
          .collection('department')
          .doc(user['departmentId'])
          .collection('year')
          .doc(widget.yearId)
          .collection('subject')
          .doc(widget.subjectId)
          .collection('unit')
          .doc(widget.unitId)
          .collection('note')
          .get();
      noteList = data.docs.map((e) => e.data()).toList();
      // final imageData = await _firestore.collection('pdfimage').get();
      // imageurl = imageData.docs[0]['url'];
    } on FirebaseException catch (e) {
      print(e);
    }
    return;
  }

  void onTapped(String id) {
    final note = noteList.where((element) => element['id'] == id).toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PdfViewerScreen(url: note[0]['pdfurl']),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: getNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Lottie.asset("assests/animation/loading.json",
                    width: 300, height: 300),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              endDrawer: const rDrawer(),
              appBar: const Appbar(leading: true),
              body: noteList.isNotEmpty
                  ? GridView.builder(
                      padding: const EdgeInsets.all(24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.97,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: noteList.length,
                      itemBuilder: (context, index) {
                        return GridItem(
                          imageUrl: 'assests/images/pdf_image.png',
                          title: noteList[index]['id'],
                          onTapped: onTapped,
                        );
                      },
                    )
                  : const Center(
                      child: Text('Coming Soon..',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Color.fromRGBO(138, 94, 65, 1),
                      ),
                      ),
                    ),
            ),
          );
        }
      },
    );
  }
}

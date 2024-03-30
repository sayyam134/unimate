import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unimate/screens/pdf_viewer_screen.dart';

import '../widgets/grid_item.dart';

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
  var imageurl;
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
      final imageData = await _firestore.collection('pdfimage').get();
      imageurl = imageData.docs[0]['url'];
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: const Color.fromRGBO(245, 237, 232, 1),
                elevation: 0,
                title: const Text(
                  'UniMate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  InkWell(
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              body: GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.97,
                  mainAxisSpacing: 20,
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return GridItem(
                    imageUrl: imageurl,
                    title: noteList[index]['id'],
                    onTapped: onTapped,
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

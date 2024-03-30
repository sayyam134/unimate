import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unimate/screens/note_screen.dart';

import '../widgets/grid_item.dart';

final _firestore = FirebaseFirestore.instance;

class UnitScreen extends StatefulWidget {
  const UnitScreen({super.key, required this.yearId, required this.subjectId});
  final String yearId;
  final String subjectId;

  @override
  State<UnitScreen> createState() {
    // TODO: implement createState
    return _UnitScreenState();
  }
}

class _UnitScreenState extends State<UnitScreen> {
  var unitList = [];
  Future<void> getUnits() async {
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
          .get();
      unitList = data.docs.map((e) => e.data()).toList();
      // unitList.sort((a, b) {
      //   a
      // },)
    } on FirebaseException catch (e) {
      print(e);
    }
    return;
  }

  void onTapped(String unit) {
    final unitData =
        unitList.where((element) => element['name'] == unit).toList();
    print(unitData[0]['id']);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NoteScreen(
            yearId: widget.yearId,
            subjectId: widget.subjectId,
            unitId: unitData[0]['id']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: getUnits(),
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
                itemCount: unitList.length,
                itemBuilder: (context, index) {
                  return GridItem(
                    title: unitList[index]['name'],
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

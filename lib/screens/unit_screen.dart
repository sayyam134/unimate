import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:unimate/screens/note_screen.dart';

import '../widgets/appBar.dart';
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
      unitList.sort(
        (a, b) => a['name'].compareTo(b['name']),
      );
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
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Lottie.asset(
                    "assests/animation/loading.json",
                    width: 300,
                    height: 300
                ),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              appBar: const Appbar(leading: true,),
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

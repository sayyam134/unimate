import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:unimate/screens/unit_screen.dart';
import '../widgets/appBar.dart';
import '../widgets/grid_item.dart';

final _firestore = FirebaseFirestore.instance;

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key, required this.yearId});
  final String yearId;

  @override
  State<SubjectScreen> createState() {
    return _SubjectScreenState();
  }
}

class _SubjectScreenState extends State<SubjectScreen> {
  var subjectList = [];

  // String name(index) {
  //   String displayword = "";
  //   String currword = subjectList[index]['name'];
  //   for (int i = 0; i < currword.length; i++) {
  //     displayword += currword[i];
  //   }
  //   return "$displayword";
  // }

  Future<void> getSubjects() async {
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
          .get();
      subjectList = data.docs.map((e) => e.data()).toList();
      subjectList.sort(
        (a, b) => a['shortform'].compareTo(b['shortform']),
      );
    } on FirebaseException catch (e) {
      print(e);
    }
    return;
  }

  void onTapped(String subject) {
    final subjectData = subjectList
        .where((element) => element['shortform'] == subject)
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            UnitScreen(yearId: widget.yearId, subjectId: subjectData[0]['id']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: getSubjects(),
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
                itemCount: subjectList.length,
                itemBuilder: (context, index) {
                  return GridItem(
                    title: subjectList[index]['shortform'],
                    subtitle: subjectList[index]['name'],
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

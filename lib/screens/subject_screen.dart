import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unimate/screens/unit_screen.dart';
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
    } on FirebaseException catch (e) {
      print(e);
    }
    return;
  }

  void onTapped(String subject) {
    final subjectData =
        subjectList.where((element) => element['name'] == subject).toList();
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
                itemCount: subjectList.length,
                itemBuilder: (context, index) {
                  return GridItem(
                    title: subjectList[index]['name'],
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

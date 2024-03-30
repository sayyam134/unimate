import 'package:flutter/material.dart';
import 'package:unimate/resources/authentication.dart';
import 'package:unimate/screens/subject_screen.dart';
import 'package:unimate/widgets/grid_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _currentindex = 0;
  void _onSelectTab(index) {
    setState(() {
      _currentindex = index;
    });
  }

  var yearList = [];
  Future<void> _getYears() async {
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
          .get();
      yearList = data.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      print(e);
    }
    return;
  }

  void onTapped(String year) {
    final yeardata =
        yearList.where((element) => element['name'] == year).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SubjectScreen(yearId: yeardata[0]['id']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getYears(),
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
                // leading: const Icon(
                //   Icons.notifications,
                //   color: Colors.black,
                // ),
                automaticallyImplyLeading: false,
                title: const Text(
                  'UniMate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Color.fromRGBO(138, 94, 65, 1),
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () async {
                      await logOut(context);
                    },
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
                itemCount: yearList.length,
                itemBuilder: (context, index) {
                  return GridItem(
                    title: yearList[index]['name'],
                    onTapped: onTapped,
                  );
                },
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  _onSelectTab(index);
                },
                currentIndex: _currentindex,
                selectedFontSize: 16,
                selectedIconTheme: const IconThemeData(
                  size: 28,
                ),
                backgroundColor: const Color.fromRGBO(138, 94, 65, 1),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white54,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_books_rounded),
                    label: 'NOTES',
                    backgroundColor: Color.fromRGBO(138, 94, 65, 1),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.groups_outlined),
                    label: 'COMMUNITY',
                    backgroundColor: Color.fromRGBO(161, 125, 100, 1),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

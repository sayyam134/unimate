import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unimate/screens/subject_screen.dart';
import 'package:unimate/widgets/appBar.dart';
import 'package:unimate/widgets/grid_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unimate/widgets/sideBar.dart';

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
    if (_currentindex != 0) {
      return;
    }
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
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
      yearList.sort(
        (a, b) => a['name'].compareTo(b['name']),
      );
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
              appBar: const Appbar(leading: false),
              body: _currentindex == 0
                  ? GridView.builder(
                      padding: const EdgeInsets.all(24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                    )
                  : const Center(
                      child: Text('Coming Soon...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Color.fromRGBO(138, 94, 65, 1),
                      ),),
                    ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  _onSelectTab(index);
                },
                currentIndex: _currentindex,
                selectedFontSize: 22,
                unselectedFontSize: 18,
                selectedIconTheme: const IconThemeData(
                  size: 34,
                ),
                unselectedIconTheme: const IconThemeData(size: 28),
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
                    label: 'CHANNEL',
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

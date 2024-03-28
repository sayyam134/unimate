import 'package:flutter/material.dart';
import 'package:unimate/resources/authentication.dart';
import 'package:unimate/widgets/grid_item.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(245, 237, 232, 1),
          elevation: 0,
          leading: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
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
                child: Image.asset('assests/images/google_logo_color.png'),
                radius: 15,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.97,
            mainAxisSpacing: 20,
          ),
          children: [
            GridItem(),
            GridItem(),
            GridItem(),
            GridItem(),
            GridItem(),
            GridItem(),
            GridItem(),
          ],
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
}

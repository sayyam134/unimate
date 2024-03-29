import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:unimate/screens/home_screen.dart';
import 'package:unimate/screens/login_screen.dart';
import 'package:unimate/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

// ...
final _auth = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unimate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(245, 237, 232, 1)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromRGBO(245, 237, 232, 1),
      ),
      home: StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const Homepage();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}

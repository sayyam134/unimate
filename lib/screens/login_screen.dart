import 'package:flutter/material.dart';
import 'package:unimate/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Unimate',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(138, 94, 65, 1),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 100,
              foregroundImage: AssetImage('assests/images/mainscreen_logo.jpg'),
            ),
            SizedBox(
              height: 60,
            ),
            LoginButton(),
          ],
        ),
      ),
    );
  }
}

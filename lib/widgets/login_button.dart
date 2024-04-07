import 'package:flutter/material.dart';
import 'package:unimate/resources/authentication.dart';
import 'package:unimate/screens/home_screen.dart';
import 'package:unimate/screens/signup.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});
  @override
  State<LoginButton> createState() {
    // TODO: implement createState
    return _LoginButtonScreen();
  }
}

class _LoginButtonScreen extends State<LoginButton> {
  void signIn() async {
    final res = await signInWithGoogle(context);
    if (res == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Signup()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Homepage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: signIn,
      child: Container(
        width: 230,
        height: 50,
        decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromRGBO(138, 94, 65, 1), width: 3),
          color: const Color.fromRGBO(245, 238, 232, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assests/images/google_logo_color.png', width: 35),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'SignUp/Login',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(138, 94, 65, 1)),
            ),
          ],
        ),
      ),
    );
  }
}

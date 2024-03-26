import 'package:flutter/material.dart';
import 'package:unimate/resources/authentication.dart';
import 'package:unimate/screens/home_screen.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginButtonScreen();
  }
}

class _LoginButtonScreen extends State<LoginButton> {
  void signIn() async {
    final res = await signInWithGoogle(context);
    if (res) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: signIn,
      splashColor: Color.fromRGBO(144, 101, 71, 0.5),
      child: Container(
        width: 230,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromRGBO(144, 101, 71, 1),
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
              'SingUp/Login',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

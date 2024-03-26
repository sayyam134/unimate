import 'package:flutter/material.dart';
import 'package:unimate/screens/signup.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
      },
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

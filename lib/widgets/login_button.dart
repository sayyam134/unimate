import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromRGBO(144, 101, 71, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.login,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'SingUp/Login',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

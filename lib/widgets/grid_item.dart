import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(context) {
    return InkWell(
      onTap: () {},
      splashColor: Color.fromRGBO(139, 94, 65, 0.3),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border:
                Border.all(color: Color.fromRGBO(139, 94, 65, 1), width: 3)),
        child: const Center(
          child: Text(
            'Computer Networks',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(163, 136, 119, 1),
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

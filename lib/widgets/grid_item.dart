import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.title, this.subtitle});
  final String title;
  final subtitle;
  @override
  Widget build(context) {
    return InkWell(
      onTap: () {},
      splashColor: const Color.fromRGBO(139, 94, 65, 3),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border:
                Border.all(color: Color.fromRGBO(139, 94, 65, 1), width: 3)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromRGBO(163, 136, 119, 1),
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              subtitle != null
                  ? Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromRGBO(163, 136, 119, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

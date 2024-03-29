import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {super.key,
      this.title,
      this.subtitle,
      required this.onTapped,
      this.imageUrl});
  final title;
  final subtitle;
  final imageUrl;
  final void Function(String year) onTapped;
  @override
  Widget build(context) {
    return InkWell(
      onTap: () {
        onTapped(title);
      },
      splashColor: const Color.fromRGBO(139, 94, 65, 3),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: const Color.fromRGBO(139, 94, 65, 1), width: 3)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageUrl == null
                ? [
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
                  ]
                : [
                    Image.network(
                      imageUrl,
                      fit: BoxFit.scaleDown,
                      height: 90,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'PDF',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(163, 136, 119, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
          ),
        ),
      ),
    );
  }
}

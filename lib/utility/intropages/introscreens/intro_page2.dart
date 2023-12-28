import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff323130),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset("assets/image_2.png"),
            ),
          ),
        ],
      ),
    );
  }
}

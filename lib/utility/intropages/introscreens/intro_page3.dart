// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff323130),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset("assets/image_3.png"),
            ),
          ),
        ],
      ),
    );
  }
}

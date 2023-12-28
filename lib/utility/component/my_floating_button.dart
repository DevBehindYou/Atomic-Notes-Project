// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyFloatingButton extends StatelessWidget {
  VoidCallback action;
  final String ico;
  final int colorValue;
  MyFloatingButton({
    required this.colorValue,
    required this.ico,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(7),
        height: 50,
        width: 75,
        decoration: BoxDecoration(
          color: Color(colorValue),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade900,
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: 1,
            )
          ],
        ),
        child: SvgPicture.asset(
          ico,
          color: Colors.white,
        ),
      ),
    );
  }
}

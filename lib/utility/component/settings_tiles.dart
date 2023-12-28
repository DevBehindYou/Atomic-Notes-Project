// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTiles extends StatelessWidget {
  final VoidCallback action;
  final String text;
  const SettingsTiles({
    required this.action,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 45,
        decoration: BoxDecoration(
            color: const Color(0xff323130),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 250,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 25,
              width: 25,
              child: SvgPicture.asset(
                'assets/forward_arrow.svg',
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: use_super_parameters, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const MyAppBar({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff323130),
      centerTitle: true,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
            color: const Color(0xff3f3e3c),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.all(9.0),
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: const Color(0xff855ef7),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/back_arrow.svg',
              color: Colors.white,
            ),
          ),
        ),
      ),
      elevation: 0.0,
    );
  }
}

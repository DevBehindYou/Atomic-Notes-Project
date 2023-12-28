// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExitButton extends StatefulWidget {
  VoidCallback action;
  final String ico;
  final int clr;
  ExitButton({
    required this.ico,
    required this.action,
    required this.clr,
    super.key,
  });

  @override
  State<ExitButton> createState() => _ExitButtonState();
}

class _ExitButtonState extends State<ExitButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action,
      child: Container(
        padding: const EdgeInsets.all(7.0),
        height: 50,
        width: 80,
        decoration: BoxDecoration(
          color: Color(widget.clr),
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
          widget.ico,
          color: Colors.white,
        ),
      ),
    );
  }
}

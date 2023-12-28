// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:atomic_notes/utility/component/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CloudButton extends StatefulWidget {
  VoidCallback action;
  final String ico;
  final int clr;
  bool isLoading;
  CloudButton({
    required this.ico,
    required this.action,
    required this.clr,
    required this.isLoading,
    super.key,
  });

  @override
  State<CloudButton> createState() => _CloudButtonState();
}

class _CloudButtonState extends State<CloudButton> {
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
        child: widget.isLoading
            ? const Center(child: circularProgress())
            : SvgPicture.asset(
                widget.ico,
                color: Colors.white,
              ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:atomic_notes/utility/component/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginButton extends StatefulWidget {
  final VoidCallback signIn;
  bool isLoading;
  String ico;
  String text;
  LoginButton({
    super.key,
    required this.isLoading,
    required this.signIn,
    required this.ico,
    required this.text,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.signIn,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            color: const Color(0xff5F5EF7),
            borderRadius: BorderRadius.circular(10)),
        child: widget.isLoading
            ? const circularProgress()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        widget.ico,
                        color: Colors.white,
                      )),
                  const SizedBox(width: 10),
                  Text(
                    widget.text,
                    style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
      ),
    );
  }
}

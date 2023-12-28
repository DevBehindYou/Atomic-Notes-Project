// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  String hintText;
  Icon ico;
  MyTextField({
    required this.ico,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
          controller: controller,
          cursorColor: Colors.deepPurple.shade300,
          decoration: InputDecoration(
            suffixIcon: ico,
            suffixIconColor: Colors.grey.shade700,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(16)),
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
          )),
    );
  }
}

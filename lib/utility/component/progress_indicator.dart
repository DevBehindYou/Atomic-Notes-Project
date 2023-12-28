// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class circularProgress extends StatelessWidget {
  const circularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

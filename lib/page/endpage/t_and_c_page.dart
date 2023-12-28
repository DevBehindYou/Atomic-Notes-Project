import 'package:atomic_notes/utility/component/my_appbar.dart';
import 'package:flutter/material.dart';

class TCPage extends StatelessWidget {
  const TCPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29283A),
      appBar: const MyAppBar(text: "TERMS AND CONDITIONS"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}

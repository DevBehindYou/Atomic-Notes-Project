import 'package:atomic_notes/utility/component/logo_container.dart';
import 'package:atomic_notes/utility/component/my_appbar.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29283A),
      appBar: const MyAppBar(
        text: "About",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:atomic_notes/utility/component/progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    _redirect();
    super.initState();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/mainpage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff29283A),
      body: Center(
        child: circularProgress(),
      ),
    );
  }
}

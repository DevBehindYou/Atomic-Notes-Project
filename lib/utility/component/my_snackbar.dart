import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  final String text;
  final int sec;

  const MySnackBar({
    required this.sec,
    required this.text,
    super.key,
  });

  void showMySnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 100,
          child: Container(
            margin: const EdgeInsets.only(bottom: 55),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xff5F5EF7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              text,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: sec),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Return a button that, when pressed, shows the custom SnackBar
    return ElevatedButton(
      onPressed: () {
        showMySnackBar(context); // Call the method here
      },
      child: const Text('Show SnackBar'),
    );
  }
}

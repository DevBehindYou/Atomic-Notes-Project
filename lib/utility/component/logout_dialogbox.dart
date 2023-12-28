// ignore_for_file: use_super_parameters, use_build_context_synchronously

import 'package:flutter/material.dart';

class DialogBoxLogout extends StatelessWidget {
  final Function action;
  final String text;

  const DialogBoxLogout({
    required this.action,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 180,
          width: 200,
          color: const Color(0xff323130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      action();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:atomic_notes/utility/component/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProConatainer extends StatelessWidget {
  final bool isLoading;
  final VoidCallback logout;
  const ProConatainer({
    super.key,
    required this.isLoading,
    required this.logout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
              color: const Color(0xff323130),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                // top left shadow is darker
                BoxShadow(
                  color: Colors.grey.shade800,
                  offset: const Offset(-2, -2),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
                // bottom right shadow is darker
                BoxShadow(
                  color: Colors.grey.shade900,
                  offset: const Offset(3, 3),
                  blurRadius: 5,
                  spreadRadius: 4,
                ),
              ]),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/photo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.asset("assets/logo_x.png"),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: logout,
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                    color: const Color(0xff5F5EF7),
                    borderRadius: BorderRadius.circular(10)),
                child: isLoading
                    ? const circularProgress()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/logout.svg",
                            height: 23,
                            width: 23,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontSize: 16),
                          )
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        )
      ],
    );
  }
}

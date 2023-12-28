import 'package:atomic_notes/utility/intropages/introscreens/intro_page2.dart';
import 'package:atomic_notes/utility/intropages/introscreens/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of pages
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // pages
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 1);
              });
            },
            children: const [
              Intro2(),
              Intro3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, -0.80),
            child: const Text(
              "TUTORIAL",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),

          // dot indicators
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip button
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(1);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                        child: Text(
                      "SKIP",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                  ),
                ),

                // dots
                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                ),

                // next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/mainpage');
                        },
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                              child: Text(
                            "DONE",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                              child: Text(
                            "NEXT",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:amazcart/view/Onboarding/home_screen.dart';
import 'package:amazcart/view/Onboarding/intro_page_1.dart';
import 'package:amazcart/view/Onboarding/intro_page_2.dart';
import 'package:amazcart/view/Onboarding/intro_page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Controller To Keep Track of  Which we're on
  PageController _controller = PageController();
  // Keep Track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Page View
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [IntroPage1(), IntroPage2(), IntroPage3()],
          ),
          //dot indicator
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Skip
                  GestureDetector(
                    onTap: (() {
                      _controller.jumpTo(2);
                    }),
                    child: Text('Skip'),
                  ),
                  //dot indicator
                  SmoothPageIndicator(controller: _controller, count: 3),
                  //Next Or Done
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          },
                          child: Text('Done'),
                        )
                      : GestureDetector(
                          onTap: (() {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }),
                          child: Text('Next'),
                        ),
                ],
              ))
        ],
      ),
    );
  }
}

import 'package:amazcart/view/Onboarding/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Welcome To Our Store',
        body: 'Alaadin Is Store For Products',
        image: SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.asset(
            'assets/images/aladdin.jpg',
            // width: 400,
            // height: 400,
            fit: BoxFit.contain,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Connect With Everyone',
        body:
            'Here you can have whatever description you would like to have, you can type it all in here',
        image: SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.asset('assets/images/aladdin3.jpg'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Discribe New Products',
        body:
            'Here you can have whatever description you would like to have, you can type it all in here',
        image: Center(
          child: Image.asset('assets/images/aladdin3.jpg'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Alaadin On Bording'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            size: Size(10, 10),
            color: Colors.blue,
            activeSize: Size.square(15),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }
}

void onDone(context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ON_BOARDING', false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomeScreen()));
}

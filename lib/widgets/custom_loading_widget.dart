// import 'package:amazcart/AppConfig/app_config.dart';
// import 'package:amazcart/utils/styles.dart';
// import 'package:amazcart/view/Onboarding/home_screen.dart';
// import 'package:amazcart/view/Onboarding/onboarding_screen.dart';
// import 'package:amazcart/widgets/animate_widget/elasticIn.dart';
// import 'package:flutter/material.dart';

// class CustomLoadingWidget extends StatefulWidget {
//   const CustomLoadingWidget({Key? key}) : super(key: key);

//   @override
//   _CustomLoadingWidgetState createState() => _CustomLoadingWidgetState();
// }

// class _CustomLoadingWidgetState extends State<CustomLoadingWidget>
//     with TickerProviderStateMixin {
//   late AnimationController animationController;

//   @override
//   void initState() {
//     animationController = AnimationController(vsync: this);
//     super.initState();
//     // Assuming you want to navigate after a certain delay (e.g., 2 seconds)
//     Future.delayed(Duration(seconds: 2), () {
//       navigateToHomePage();
//     });
//   }

//   void navigateToHomePage() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElasticIn(
//       manualTrigger: false,
//       animate: true,
//       infinite: true,
//       controller: (AnimationController) {},
//       //  key: key,
//       child: Center(
//         child: CircleAvatar(
//           //  foregroundColor: Color(0xff0e0c75),
//           // backgroundColor: Color(0xff0e0c75),
//           radius: 30,

//           child: Image.asset(
//             'assets/images/loadfanous.png',
//             // width: 30,
//             // height: 30,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:amazcart/view/Onboarding/onboarding_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatefulWidget {
  const CustomLoadingWidget({super.key});

  @override
  State<CustomLoadingWidget> createState() => _CustomLoadingWidgetState();
}

class _CustomLoadingWidgetState extends State<CustomLoadingWidget> {
  @override
  void initState() {
    super.initState();

    // Navigate to home page after a delay (e.g., 3 seconds)
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircleAvatar(
          foregroundColor: Color(0xff0e0c75),
          backgroundColor: Color(0xff0e0c75),
          radius: 30,
          child: Image.asset(
            'assets/images/loadfanous.png', // Replace with your flare animation file
            ///animation: 'zoomInOut',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController fadeController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(fadeController);

    fadeController.forward();

    // Navigate to home page after a delay (e.g., 3 seconds)
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: CircleAvatar(
            foregroundColor: Color(0xff0e0c75),
            backgroundColor: Color(0xff0e0c75),
            radius: 30,
            child: Image.asset(
              'assets/images/loadfanous.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

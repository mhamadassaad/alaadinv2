import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                // Padding(
                //   padding:
                //       const EdgeInsets.only(right: 100, top: 50, bottom: 10),
                //   child: Image.asset(
                //     'assets/images/arl.png',
                //     width: 112.5,
                //     height: 113.32,
                //   ),
                // ),
                // Padding(
                //   padding:
                //       const EdgeInsets.only(left: 190, top: 50, bottom: 10),
                //   child: Image.asset(
                //     'assets/images/o2.png',
                //     width: 112.5,
                //     height: 113.32,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 150, bottom: 0),
                  child: Image.asset(
                    'assets/images/a5.png',
                    width: 576,
                    height: 326,
                  ),
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.only(right: 180, top: 100, bottom: 10),
                //   child: Image.asset(
                //     'assets/images/o3.png',
                //     width: 91.5,
                //     height: 90.55,
                //   ),
                // ),
                // Padding(
                //   padding:
                //       const EdgeInsets.only(right: 180, top: 300, bottom: 10),
                //   child: Image.asset(
                //     'assets/images/o11.jpg',
                //     width: 84,
                //     height: 94.25,
                //   ),
                // ),
                // Padding(
                //   padding:
                //       const EdgeInsets.only(left: 320, top: 250, bottom: 0),
                //   child: Image.asset(
                //     'assets/images/o5.png',
                //     width: 78,
                //     height: 81.39,
                //   ),
                // ),
                // Padding(
                //   padding:
                //       const EdgeInsets.only(left: 260, top: 390, bottom: 0),
                //   child: Image.asset(
                //     'assets/images/o4.png',
                //     width: 79.58,
                //     height: 108,
                //   ),
                // ),
              ],
            ),
            Stack(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 1, top: 10),
                  child: Text(
                    'Get Offers Consistently',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    //    style: CustomTextStyle.nameOfTextStyle9,
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 1, top: 40),
                //   child: Text(
                //     '& Analytics',
                //     //   style: CustomTextStyle.nameOfTextStyle9,
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 1,
                    top: 60,
                  ),
                  child: Text(
                    'Our offers are ongoing throughout the year,',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    // style: CustomTextStyle.nameOfTextStyle10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 1,
                    top: 80,
                  ),
                  child: Text(
                    'Especially during global occasions,',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    // style: CustomTextStyle.nameOfTextStyle10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 1,
                    top: 100,
                  ),
                  child: Text(
                    '& Our prices are competitive.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    // style: CustomTextStyle.nameOfTextStyle10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

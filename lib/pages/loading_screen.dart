import 'package:flutter/material.dart';
import 'package:pizza_planet/pages/login.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pizza_planet/utils.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: primaryRed,

        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: primaryRed,
          // margin: EdgeInsets.only(left: ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: AnimatedSplashScreen(
            splash: Lottie.asset('images/ayXdhyEQ3h.json'),
            nextScreen: const Login(),
            duration: 3000,
            pageTransitionType: PageTransitionType.rightToLeft,
            splashIconSize: double.infinity * 0.5,
          ),
        ),

        Padding(padding: EdgeInsets.only(top: 20)),

        SizedBox(
          child: AnimatedTextKit(animatedTexts: [
            ScaleAnimatedText("Pizza Planet",
                textStyle: TextStyle(fontSize: 40 , color: Colors.red , fontWeight: FontWeight.w600)),
          ]),
          // child: Text(
          //   "Pizza Planet",
          //   style: TextStyle(
          //     fontSize: 50,
          //     fontFamily: 'Horizon',
          //     color: Colors.red,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
        ),

        // Text("Pizza Planet")
      ],
    ));
  }
}

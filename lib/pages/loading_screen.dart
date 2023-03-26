import 'package:flutter/material.dart';
import 'package:pizza_planet/pages/login.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pizza_planet/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryRed,
      body: Container(
        color: primaryRed,
        width: MediaQuery.of(context).size.width,
        child: AnimatedSplashScreen(
          splash: Lottie.asset('images/ayXdhyEQ3h.json'),
          nextScreen: const Login(),
          duration: 3000,
          pageTransitionType: PageTransitionType.rightToLeft,
          splashIconSize: double.infinity,
        ),
      
      ),
      
    );
  }
}

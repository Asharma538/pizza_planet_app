import 'package:flutter/material.dart';
import 'package:pizza_planet/cartProvider/provider.dart';
import 'package:pizza_planet/pages/login.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pizza_planet/utils.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

import '../main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isLoggedIn = false;
  getuser() async{
    bool userStatus = await SharedPref.getBoolValuesSF("LoggedIn");
    setState(() {
      isLoggedIn = userStatus;
    });
  }
  @override
  void initState(){
    super.initState();
    getuser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            color: primaryRed,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: AnimatedSplashScreen(
              splash: Lottie.asset('images/ayXdhyEQ3h.json'),
              nextScreen: isLoggedIn? const MainScreen(): const Login(),
              duration: 3000,
              pageTransitionType: PageTransitionType.rightToLeft,
              splashIconSize: double.infinity * 0.5,
            ),
          ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        // SizedBox(
        //   child: AnimatedTextKit(animatedTexts: [
        //     ScaleAnimatedText("Pizza Planet",
        //         textStyle: TextStyle(fontSize: 40 , color: Colors.red , fontWeight: FontWeight.w600)),
        //   ]),
        // ),

        // Text("Pizza Planet")
      ],
    ));
  }
}

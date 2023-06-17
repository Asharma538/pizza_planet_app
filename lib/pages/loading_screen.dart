import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pizza_planet/pages/login.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pizza_planet/utils.dart';
import '../image_controller.dart';
import '../main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isLoggedIn = false;
  getUser() async{
    bool userStatus = await SharedPref.getBoolValuesSF("LoggedIn");
    setState(() {
      isLoggedIn = userStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => imageController());
    imageController _imagecontroller = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
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
              nextScreen: isLoggedIn ? const MainScreen() : const Login(),
              duration: 3000,
              pageTransitionType: PageTransitionType.rightToLeft,
              splashIconSize: double.infinity * 0.5,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Image(image: const AssetImage('images/app_logo.png'),width: MediaQuery.of(context).size.width*0.85,)
        ],
    ));
  }
}

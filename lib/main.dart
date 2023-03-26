import 'package:flutter/material.dart';
import 'package:pizza_planet/pages/loading_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//     return AnimatedSplashScreen(
//       splash : Lottie.asset('images/64809-pizza-loading.json'),
//       nextScreen : const Login(),
//       duration: 3000,
//       splashTransition: SplashTransition.sizeTransition,
//       pageTransitionType: PageTransitionType.leftToRight,
//     );
//   }
// }

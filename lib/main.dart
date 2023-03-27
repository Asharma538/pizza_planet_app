import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizza_planet/pages/loading_screen.dart';
import 'package:pizza_planet/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCNiP-_V8SpEviAuJruq8vEjZEucwP82lA', // Your apiKey
      appId: '140792705515:android:c8a956d7c20b767a6ee9ae', // Your appId
      messagingSenderId: '140792705515', // Your messagingSenderId
      projectId: 'pizza-planet-app-03082905', // Your projectId
),
  );
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

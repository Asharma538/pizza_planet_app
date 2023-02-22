import 'package:flutter/material.dart';
import 'package:pizza_planet/pages/home.dart';
import 'package:pizza_planet/utils.dart';
var scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Home(),
    );
  }
}

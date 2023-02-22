import 'package:flutter/material.dart';
import 'package:pizza_planet/components/app_bar.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 80,
              child: const Appbar(),
            )
          ],
        ),
      ),
    );
  }
}

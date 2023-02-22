import 'package:flutter/material.dart';
import 'package:pizza_planet/utils.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        centerTitle: true,
        title: const Text(
            'Pizza Planet'
        ),
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: const Icon(Icons.person),
          ),
        ]
      ),
    );
  }
}

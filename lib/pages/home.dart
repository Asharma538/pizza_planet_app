import 'package:flutter/material.dart';
import 'package:pizza_planet/utils.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String searchValue = '';
    final List<String> _suggestions = ['Afeganistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German', 'Madagascar', 'Mozambique', 'Portugal', 'Zambia'];

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(14, 15, 14, 0),
            // height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFFCFCFF),
              border: Border.all(color: primaryBorderDarkWhite,width: 1),
              borderRadius: BorderRadius.circular(5)
            ),
          ),
        ],
      ),
    );
  }
}


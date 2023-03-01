import 'package:flutter/material.dart';
import 'package:pizza_planet/utils.dart';

Widget categoryItem(String path){
  return Container(
    margin: const EdgeInsets.fromLTRB(15, 18, 15, 5),
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: primaryBorderDarkWhite,width: 0.4),
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color(0xFFB9B9B9),
          blurRadius: 6,
          offset: Offset(
          0,
          6,
          )
        )
      ],
    ),
    child: Image(
      image: AssetImage(path),
      height: 80,
      width: 80,
    ),
  );
}

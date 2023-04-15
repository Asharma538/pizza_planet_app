import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const primaryRed = Color(0xFFF03A47);
const primaryDarkRed = Color(0xFF6C000C);
const primaryBlue = Color(0xFF001631);
const primaryWhite = Color(0xFFFFFFFF);
const ghostWhite = Color(0xFFF8F8FF);
const primaryBorderLightWhite = Color(0xFFEFEFEF);
const primaryBorderDarkWhite = Color(0xFFA2A2A2);
const primaryBlack = Color(0xFF000000);

class SharedPref{

  static addStringToSF(String s1,String s2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(s1, s2);
  }
  static addIntToSF(String s1,int s2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(s1, s2);
  }
  static addDoubleToSF(String s1,double s2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(s1, s2);
  }
  static addBoolToSF(String s1,bool s2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(s1, s2);
  }
  static getStringValuesSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(s)?? "";
    return stringValue;
  }
  static getBoolValuesSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(s)?? false;
    print(boolValue);
    return boolValue;
  }
  static getIntValuesSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue = prefs.getInt(s)?? 0;
    return intValue;
  }
  static getDoubleValuesSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double doubleValue = prefs.getDouble(s)?? 0.0;
    return doubleValue;
  }
  static removeValues(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("s");
  }
  static checkValue(String s)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkVal = prefs.containsKey(s);
    return checkVal;
  }
}
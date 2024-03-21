import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Jalnan',
      textTheme: customTextTheme,
    ),
    home: HomeScreen(),
  ));
}

TextTheme customTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  ),
  displayMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  ),
  displaySmall: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
  bodySmall: TextStyle(
    fontSize: 10,
    color: Colors.grey,
  ),
);



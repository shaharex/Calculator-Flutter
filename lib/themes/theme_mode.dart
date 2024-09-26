import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 233, 233, 233),
    primary: Color.fromARGB(255, 255, 255, 255),
    secondary: Colors.white,
    tertiary: Color(0xffADE2FF),
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Color(0xff303136),
    secondary: Color(0xff616161),
    tertiary: Color(0xff005DB2),
  ),
);

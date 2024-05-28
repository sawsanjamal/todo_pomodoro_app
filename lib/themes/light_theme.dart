import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.lightBlueAccent[100]!,
        onBackground: Colors.cyan[100]!,
        onPrimaryContainer: Colors.lightBlueAccent,
        primary: Colors.lightGreenAccent[100]!,
        onPrimary: Colors.greenAccent[100]!,
        secondary: Colors.grey[100]!,
        tertiary: Colors.white,
        onSecondary: Colors.black54));

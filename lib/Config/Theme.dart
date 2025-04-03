import 'package:e_book/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


var lightTheme = ThemeData(
  useMaterial3: true,

  //  Color style Define
  colorScheme:  ColorScheme(
    brightness: Brightness.light,
    onPrimary: backgroundColor,
    primary: PrimaryColor,
    secondary: SecondaryColor,
    onSecondary: backgroundColor,
    error: Colors.red,
    onError: fontColor,
    background: backgroundColor,
    onBackground: fontColor,
    surface: backgroundColor,
    onSurface: fontColor,
  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 30,
      fontWeight: FontWeight.w600,

    ),
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w600,

    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w500,

    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      fontWeight: FontWeight.w500,

    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      fontWeight: FontWeight.w500,

    ),
    labelLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w500,

    ),
    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      fontWeight: FontWeight.w500,

    ),

    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      fontWeight: FontWeight.w500,

    ),

  ),
);


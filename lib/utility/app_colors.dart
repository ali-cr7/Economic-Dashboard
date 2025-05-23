import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
    static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFEAEBEA);
  static const Color background = Color(0xFFF5F5F5);
  static const Color black38 = Color(0x61000000); // 38% opacity
  static const Color darkGreen = Color(0xFF22842D);
  static const Color green15 = Color(0x26FFCC02);
  static const Color redColor = Color(0xFFD81721);
  static const Color lightBlue = Color(0x3F9A8AEC);
  static const Color black82 = Color(0xD1000000); // 82% opacity
  static const Color lightPurple = Color(0xFF9A8AEC);
  static const Color black88 = Color(0xE0000000); // 88% opacity
  static const Color gray = Color(0xFFD9D9D9);
  static const Color neonYellow = Color(0xFFE4FF1C);
  static const Color black46 = Color(0x75000000); // 46% opacity
  static const Color black25 = Color(0x40000000); // 25% opacity
  static const Color mediumGreen = Color(0xFF088711);
  static const Color brightGreen = Color(0xFF21D937);
  static const Color oliveGreen = Color(0xFF686F08);
  static const Color teal = Color(0xFF8CE996);
  static const Color mutedYellow = Color(0xFFD8EC43);
  static const Color gray25 = Color(0x40D9D9D9); // 25% opacity
  static const Color brightRed = Color(0xFFF1272B);
  static const Color green = Color(0xA5088711);

  static const purple =  Color(0xFF836BFD);
  static const blueGradient = LinearGradient(
    begin: Alignment(0.00, 0.50),
    end: Alignment(1.00, 0.50),
    colors: [
      Color(0xFF836BFD),
      Color(0xFF6855CA),
      Color(0xFF5B4AB0),
      Color(0xFF4E3F97),
    ],
  );

  static const backgroundGradient = LinearGradient(
    begin: Alignment(0.12, 0.82),
    end: Alignment(0.87, 0.18),
    colors: [Color(0xFF978AEC), Color(0xFF766CB9), Color(0xFF554E86)],
  );
}

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
   static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFEAEBEA);
  static const Color background = Color(0xFFF5F5F5);
  static const Color black38 = Color(0x61000000); // 3
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

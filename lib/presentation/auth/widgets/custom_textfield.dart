import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          // prefixIcon: Icon(icon, color: Colors.grey),
          suffixIcon:
              isPassword
                  ? Icon(Icons.visibility_off, color: Colors.grey)
                  : Icon(icon, color: Colors.grey),
          filled: true,
          
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 2, color: const Color(0xFF836BFD)),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search ....',
    
        hintStyle: TextStyle(
          color: Colors.white70,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
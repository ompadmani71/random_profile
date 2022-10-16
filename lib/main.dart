import 'package:flutter/material.dart';
import 'package:random_user/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color(0xff6d60f8),
    ),
    home: const HomeScreen(),
  ));
}


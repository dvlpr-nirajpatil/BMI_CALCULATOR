import 'package:bmiapp/consts/color_pallate.dart';
import 'package:bmiapp/views/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const bmiapp());
}

class bmiapp extends StatelessWidget {
  const bmiapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(centerTitle: true),
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: regular),
      home: const HomeScreen(),
    );
  }
}

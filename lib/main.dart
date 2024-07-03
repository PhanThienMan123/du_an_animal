import 'package:du_an_animal/Pages/AccountPages/LoginScreen.dart';
import 'package:du_an_animal/Pages/AccountPages/RegisterScreen.dart';
import 'package:du_an_animal/Pages/HomePage.dart';
import 'package:du_an_animal/Widgets/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

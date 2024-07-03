import 'dart:async';

import 'package:du_an_animal/Constant/Constant.dart';
import 'package:du_an_animal/Constant/Fonts.dart';
import 'package:du_an_animal/Pages/AccountPages/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Get.to(() => MyLogin());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Text(
              "ANIMAL HELPING",
              style: StyleFont.font_splash,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          ClipOval(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(color: Colors.white),
              child: Image.network(
                url_Logo,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:du_an_animal/Constant/Constant.dart';
import 'package:du_an_animal/Constant/Fonts.dart';
import 'package:du_an_animal/Pages/AccountPages/ForgotPassword.dart';
import 'package:du_an_animal/Pages/AccountPages/RegisterScreen.dart';
import 'package:du_an_animal/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final email = TextEditingController();
  final password = TextEditingController();
  final key = GlobalKey<FormState>();
  bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(color: Colors.white),
              width: 100,
              height: 100,
              child: Image.network(
                url_Logo,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Sign In",
                style: StyleFont.font_Account,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.grey),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey,
                  //       blurRadius: 10,
                  //       offset: Offset(4, 8))
                  // ]),
                ),
                child: Form(
                    key: key,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 80,
                          margin: EdgeInsets.only(top: 50),
                          child: TextFormField(
                            controller: email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              } else if (GetUtils.isEmail(value)) {
                                return null;
                              }
                              return "Invalid email";
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Your Email",
                                prefixIcon: Icon(Icons.email),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 80,
                          child: TextFormField(
                            obscureText: isHidePassword,
                            controller: password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              } else if (value.length < 4) {
                                return "password is less than 4 character";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Your Password",
                                contentPadding: EdgeInsets.all(10),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isHidePassword = !isHidePassword;
                                      });
                                    },
                                    icon: Icon(isHidePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                Get.offAll(() => MyHomePage());
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 19),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xff353935)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ForgotPassword());
                            },
                            child: Text(
                              "Forget Password? ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Overpass"),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 0,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  height: 1,
                                  width: 120,
                                  decoration:
                                      BoxDecoration(color: Colors.black),
                                )),
                            Expanded(
                                flex: 0,
                                child: Container(
                                  child: Text(
                                    "Or countinue with",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                )),
                            Expanded(
                                flex: 0,
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  height: 1,
                                  width: 120,
                                  decoration:
                                      BoxDecoration(color: Colors.black),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xffe5e4e2),
                              borderRadius:
                                  BorderRadiusDirectional.circular(40)),
                          child: Text(
                            "Login with Gmail",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff0047ab),
                              borderRadius:
                                  BorderRadiusDirectional.circular(40)),
                          child: Text(
                            "Login with Facebook",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 0,
                                child: Container(
                                  child: Text(
                                    "Don't you have account with us?",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )),
                            Expanded(
                                flex: 0,
                                child: TextButton(
                                    onPressed: () {
                                      Get.to(() => MyRegister());
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Color(0xff0096ff),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    )))
                          ],
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

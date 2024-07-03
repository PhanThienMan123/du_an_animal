import 'package:du_an_animal/Constant/Constant.dart';
import 'package:du_an_animal/Constant/Fonts.dart';
import 'package:du_an_animal/Pages/AccountPages/ForgotPassword.dart';
import 'package:du_an_animal/Pages/AccountPages/LoginScreen.dart';
import 'package:du_an_animal/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

enum SingingCharacter { Male, Female }

class _MyRegisterState extends State<MyRegister> {
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final address = TextEditingController();
  final key = GlobalKey<FormState>();
  bool isHidePassword = true;
  SingingCharacter? _character = SingingCharacter.Male;
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
                "Sign Up",
                style: StyleFont.font_Account,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Form(
                key: key,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 80,
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Your Username",
                            prefixIcon: Icon(Icons.account_circle),
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 80,
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
                        controller: address,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your address";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Your Address",
                            prefixIcon: Icon(Icons.location_on),
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      margin: EdgeInsets.only(left: 23, bottom: 20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text("Male"),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.Male,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("Female"),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.Female,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          )
                        ],
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
                          "Sign Up",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 0,
                            child: Container(
                              child: Text(
                                "You have the account?",
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                        Expanded(
                            flex: 0,
                            child: TextButton(
                                onPressed: () {
                                  Get.to(() => MyLogin());
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Color(0xff0096ff),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                )))
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

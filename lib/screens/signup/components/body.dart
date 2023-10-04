import 'package:flutter/material.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/sizeconfig.dart';

import 'signup_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: 
          EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Container(
                  height: getProportionateScreenHeight(40.56),
                  width: getProportionateScreenWidth(49.92),
                  child: Image.asset(
                    "lib/images/splash.png",
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text(
                  "Register Account",
                  style: headingStyle,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  "Sign up with your email \nor continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextLightColor,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
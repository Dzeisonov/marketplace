import 'package:flutter/material.dart';
import 'package:marketplace/screens/forgotpw/forgotpw.dart';
import 'package:marketplace/sizeconfig.dart';

import '../../../components/no_account.dart';
import '../../../components/social_card.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: 
            EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(30)),
                Container(
                  height: getProportionateScreenHeight(40.56),
                  width: getProportionateScreenWidth(49.92),
                  child: Image.asset(
                    "lib/images/splash.png",
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  "Log in with your email and password\n or continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                LogInForm(),
                SizedBox(height: getProportionateScreenHeight(25)),
                Text(
                  "or using",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "lib/icons/facebook.png",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "lib/icons/google.png",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "lib/icons/instagram.png",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                noAccount(),
                SizedBox(height: getProportionateScreenHeight(38)),
              ],
            ),
          ),
        ),
      )
    );
  }
}
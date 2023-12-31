import 'package:flutter/material.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/screens/login/login.dart';
import 'package:marketplace/sizeconfig.dart';

import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/icons/verified.png",
            height: SizeConfig.screenHeight * 0.22,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
          Text("Register Success",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              )),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
          DefaultButton(
            text: "Log in now!",
            press: () {
              Navigator.pushNamed(context, LogInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

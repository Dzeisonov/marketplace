import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/login/login.dart';
import '../sizeconfig.dart';

class haveAccount extends StatelessWidget {
  const haveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(12),
            color: kTextLightColor,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, LogInScreen.routeName),
          child: Text(
            "Log in",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(12),
              fontWeight: FontWeight.bold,
              color: kTextLightColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:marketplace/constants.dart';

import '../screens/forgotpw/forgotpw.dart';
import '../sizeconfig.dart';

class noAccount extends StatelessWidget {
  const noAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(12),
            color: kTextLightColor,
          ),
        ),
        GestureDetector(
          onTap: () {

          },
          child: Text(
            "Sign Up",
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
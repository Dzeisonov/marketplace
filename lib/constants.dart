import 'package:flutter/material.dart';
import 'package:marketplace/sizeconfig.dart';

const kPrimaryColor = Color(0xFFFFFFFF);
const kPrimaryLightColor = Color(0xFFCED4DA);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFFADB5BD);
const kTextColor = Color(0xFF212529);
const kTextLightColor = Color(0xFFF8F9FA);
const kProductTextColor = Color(0xFF212529);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    );

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter valid email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";

// References :
// Onboarding Screen - Complete E-Commerce App Flutter UI - Ep 1 - Speed Code
// The Flutter Way on YouTube
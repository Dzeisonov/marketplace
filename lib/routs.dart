import 'package:flutter/widgets.dart';
import 'package:marketplace/navbar.dart';
import 'package:marketplace/screens/complete_profile/cpscreen.dart';
import 'package:marketplace/screens/forgotpw/forgotpw.dart';
import 'package:marketplace/screens/login/login.dart';
import 'package:marketplace/screens/loginsuccess/loginscs.dart';
import 'package:marketplace/screens/paysuccess/payscs.dart';
import 'package:marketplace/screens/signup/signup.dart';
import 'package:marketplace/screens/signupsuccess/signupscs.dart';
import 'package:marketplace/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LogInScreen.routeName: (context) => LogInScreen(),
  ForgotPwScreen.routeName: (context) => ForgotPwScreen(),
  LogInScsScreen.routeName: (context) => LogInScsScreen(),
  PayScsScreen.routeName: (context) => PayScsScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  NavBar.routeName: (context) => NavBar(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  SignUpScsScreen.routeName: (context) => SignUpScsScreen(),
};

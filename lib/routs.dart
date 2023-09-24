import 'package:flutter/widgets.dart';
import 'package:marketplace/navbar.dart';
import 'package:marketplace/screens/forgotpw/forgotpw.dart';
import 'package:marketplace/screens/login/login.dart';
import 'package:marketplace/screens/loginsuccess/loginscs.dart';
import 'package:marketplace/screens/signup/signup.dart';
import 'package:marketplace/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LogInScreen.routeName: (context) => LogInScreen(),
  ForgotPwScreen.routeName: (context) => ForgotPwScreen(),
  LogInScsScreen.routeName: (context) => LogInScsScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  NavBar.routeName: (context) => NavBar(),
};
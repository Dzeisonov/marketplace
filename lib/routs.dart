import 'package:flutter/widgets.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/catalog.dart';
import 'package:marketplace/homepage.dart';
import 'package:marketplace/navbar.dart';
import 'package:marketplace/profile.dart';
import 'package:marketplace/screens/forgotpw/forgotpw.dart';
import 'package:marketplace/screens/login/login.dart';
import 'package:marketplace/screens/loginsuccess/loginscs.dart';
import 'package:marketplace/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LogInScreen.routeName: (context) => LogInScreen(),
  ForgotPwScreen.routeName: (context) => ForgotPwScreen(),
  LogInScsScreen.routeName: (context) => LogInScsScreen(),
  HomePage.routeName: (context) => HomePage(),
  NavBar.routeName: (context) => NavBar(),
};
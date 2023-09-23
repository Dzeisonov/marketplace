import 'package:flutter/widgets.dart';
import 'package:marketplace/screens/login/login.dart';
import 'package:marketplace/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LogInScreen.routeName: (context) => LogInScreen(),
};
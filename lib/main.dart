import 'package:flutter/material.dart';
// import 'package:marketplace/login.dart';
// import 'package:marketplace/navbar.dart';
// import 'package:marketplace/constants.dart';
import 'package:marketplace/screens/splash/splash_screen.dart';
import 'package:marketplace/routs.dart';
import 'package:marketplace/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
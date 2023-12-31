import 'package:flutter/material.dart';
import 'package:marketplace/screens/login/components/body.dart';
import 'package:marketplace/screens/splash/splash_screen.dart';

class LogInScreen extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, SplashScreen.routeName);
          },
        ),
      ),
      body: Body(),
    );
  }
}
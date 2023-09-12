import 'package:flutter/material.dart';
import 'package:marketplace/login.dart';
import 'package:marketplace/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? NavBar()
          : LoginScreen(onLoggedIn: () {
              // Callback function to update isLoggedIn state
              setState(() {
                isLoggedIn = true;
              });
            }),
    );
  }
}

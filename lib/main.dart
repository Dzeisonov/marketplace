import 'package:flutter/material.dart';
import 'package:marketplace/data.dart';
// import 'package:marketplace/login.dart';
// import 'package:marketplace/navbar.dart';
// import 'package:marketplace/constants.dart';
import 'package:marketplace/screens/splash/splash_screen.dart';
import 'package:marketplace/routs.dart';
import 'package:marketplace/theme.dart';
import 'package:marketplace/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CartProvider()), // Provide CartProvider
      ],
      child: const MyApp(),
    ),
  );
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

import 'package:flutter/material.dart';
import 'package:marketplace/screens/login/components/body.dart';

class LogInScreen extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

// class LoginScreen extends StatefulWidget {
//   static String routeName = "/login";

//   @override
//   State<LoginScreen> createState() => _LoginState();
// }

// class _LoginState extends State<LoginScreen> {
//   bool isLoggedIn = false;

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Body(onLoggedIn: () {
//         // Callback function to update isLoggedIn state
//         setState(() {
//           isLoggedIn = true;
//         });
//       },),
//     );
//   }
// }
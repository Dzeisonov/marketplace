import 'package:flutter/material.dart';
import 'package:marketplace/accs.dart';

class AccsPage extends StatefulWidget {
  AccsPage({Key? key}) : super(key: key);

  @override
  State<AccsPage> createState() => _AccsPageState();
}

class _AccsPageState extends State<AccsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Accessories"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.center,
              child: AccsScreen(),
            )));
  }
}

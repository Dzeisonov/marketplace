import 'package:flutter/material.dart';
import 'package:marketplace/hats.dart';

class HatsPage extends StatefulWidget {
  HatsPage({Key? key}) : super(key: key);

  @override
  State<HatsPage> createState() => _HatsPageState();
}

class _HatsPageState extends State<HatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Hats"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.center,
              child: HatsScreen(),
            )));
  }
}

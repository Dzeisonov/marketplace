import 'package:flutter/material.dart';
import 'package:marketplace/shoes.dart';

class ShoesPage extends StatefulWidget {
  ShoesPage({Key? key}) : super(key: key);

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Shoes"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.center,
              child: ShoesScreen(),
            )));
  }
}

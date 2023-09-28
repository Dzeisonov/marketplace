import 'package:flutter/material.dart';

class CustomPage extends StatefulWidget {
  final String appBarTitle;
  final Widget lastChild;

  CustomPage({
    required this.appBarTitle,
    required this.lastChild,
  });

  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.appBarTitle),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Align(
          alignment: Alignment.center,
          child: widget.lastChild,
        ),
      ),
    );
  }
}

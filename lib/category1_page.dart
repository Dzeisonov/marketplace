import 'package:flutter/material.dart';

class Category1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Category 1'),
      ),
      body: Center(
        child: Text('This is Category 1 page.'),
      ),
    );
  }
}

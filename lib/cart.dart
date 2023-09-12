import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade200,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Cart Page'),
            )));
  }
}

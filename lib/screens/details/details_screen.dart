import 'package:flutter/material.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  final String imgPath;
  final String name;
  final double rating;
  final double price;
  final String description;

  DetailsScreen({
    required this.imgPath,
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(
        imgPath: imgPath,
        name: name,
        rating: rating,
        price: price,
        description: description,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  final String imgPath;
  final String name;
  final double rating;
  final double price;

  DetailsScreen({required this.imgPath, required this.name, required this.rating, required this.price,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: rating),
      ),
      body: Body(imgPath: imgPath, name: name, rating: 
      rating, price: price,),
    );
  }
}

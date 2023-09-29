import 'package:flutter/material.dart';
import 'package:marketplace/data.dart';
import 'components/body.dart';
import 'components/app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  final ShopItem shopItem;

  DetailsScreen({required this.shopItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: shopItem.rating),
      ),
      body: Body(shopItem: shopItem),
    );
  }
}

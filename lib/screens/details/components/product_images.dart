import 'package:flutter/material.dart';
import 'package:marketplace/data.dart';
import 'package:marketplace/sizeconfig.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.shopItem,
  }) : super(key: key);

  final ShopItem shopItem;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.shopItem.toString(),
              child: Image.network(widget.shopItem.imgPath),
            ),
          ),
        )
      ],
    );
  }
}

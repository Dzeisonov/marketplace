import 'package:flutter/material.dart';
import 'package:marketplace/data.dart';

import 'package:marketplace/constants.dart';
import 'package:marketplace/sizeconfig.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.shopItem,
    this.pressOnSeeMore,
  }) : super(key: key);

  final ShopItem shopItem;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            shopItem.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
            top: 16,
          ),
          child: Text(
            description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(children: [
              Text(
                "See More Detail",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: kTextColor),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward,
                size: 12,
                color: kTextColor,
              )
            ]),
          ),
        ),
        SizedBox(height: 165),
        Padding(
          padding: EdgeInsets.only(left: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price: \$${shopItem.price}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

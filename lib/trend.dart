import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/data.dart';
import 'package:marketplace/provider.dart';
import 'package:provider/provider.dart';

class TrendScreen extends StatefulWidget {
  const TrendScreen({Key? key}) : super(key: key);

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildItemContainer(ShopItem.shopItemsTrend),
        ],
      ),
    );
  }

  Widget _buildItemContainer(List<ShopItem> data) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.016;

    List<Widget> rows = [];
    List<ShopItem> shopItems = List.from(data); // Create a copy

    while (shopItems.isNotEmpty) {
      List<Widget> rowChildren = [];

      for (int i = 0; i < 2 && shopItems.isNotEmpty; i++) {
        ShopItem item = shopItems.removeAt(0);
        rowChildren.add(
            _buildShopItem(item.imgPath, item.name, item.rating, item.price));
      }

      rows.add(
        Row(
          children: rowChildren,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: containerWidth),
      child: Column(
        children: rows,
      ),
    );
  }

  Widget _buildShopItem(
      String image, String name, double rating, double price) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      height: 295,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ], // Set the border-radius value
      ),
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage(image),
              width: 160,
              height: 160,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                SizedBox(width: 2),
                Text(
                  rating.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kProductTextColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kProductTextColor,
                ),
              ),
            ]),
            SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + price.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kProductTextColor,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      CartItem cartItem =
                          CartItem(image, name, rating, price, 1);
                      final cartProvider =
                          Provider.of<CartProvider>(context, listen: false);
                      cartProvider.addItemToCart(cartItem);

                      ElegantNotification(
                        notificationPosition: NotificationPosition.topCenter,
                        animation: AnimationType.fromTop,
                        width: 360,
                        height: 50,
                        // title: const Text('Success!'),
                        description: Text("$name added to cart"),
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.black,
                        ),
                        progressIndicatorColor: Colors.black,
                      ).show(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}

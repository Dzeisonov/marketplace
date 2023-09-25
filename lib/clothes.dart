import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/data.dart';
import 'package:marketplace/provider.dart';
import 'package:provider/provider.dart';

class ClothesScreen extends StatefulWidget {
  const ClothesScreen({Key? key}) : super(key: key);

  @override
  State<ClothesScreen> createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {
  late Timer _timer;
  List<bool> isCartTappedList =
      List.filled(ShopItem.shopItemsClothes.length, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildItemContainer(ShopItem.shopItemsClothes),
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
        int itemIndex = data.indexOf(item); // Get the index of the item

        rowChildren.add(_buildShopItem(
            item.imgPath, item.name, item.rating, item.price, itemIndex));
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
      String image, String name, double rating, double price, int itemIndex) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      height: 295,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
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
                    fontFamily: "Montserrat",
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
                  fontFamily: "Montserrat",
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCartTappedList[itemIndex] =
                            true; // Set the tapped state for this button
                      });
                      CartItem cartItem =
                          CartItem(image, name, rating, price, 1);
                      final cartProvider =
                          Provider.of<CartProvider>(context, listen: false);
                      cartProvider.addItemToCart(cartItem);

                      // Start a timer to reset the color after 1 second
                      _timer = Timer(Duration(milliseconds: 50), () {
                        setState(() {
                          isCartTappedList[itemIndex] =
                              false; // Reset the tapped state for this button
                        });
                      });

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
                        color: isCartTappedList[itemIndex]
                            ? Colors.grey
                            : Colors.black,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}

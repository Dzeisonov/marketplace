import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/data.dart';
import 'package:marketplace/provider.dart';
import 'package:marketplace/screens/details/components/product_description.dart';
import 'package:marketplace/screens/details/components/product_images.dart';
import 'package:marketplace/screens/details/components/top_rounded_container.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final ShopItem shopItem;

  const Body({Key? key, required this.shopItem}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isCartTappedList = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        children: [
          ProductImages(shopItem: widget.shopItem),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  shopItem: widget.shopItem,
                  pressOnSeeMore: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isCartTappedList = true; // Set the tapped state for this button
            });
            CartItem cartItem = CartItem(
              widget.shopItem.imgPath,
              widget.shopItem.name,
              widget.shopItem.rating,
              widget.shopItem.price,
              1,
            );
            final cartProvider =
                Provider.of<CartProvider>(context, listen: false);
            cartProvider.addItemToCart(cartItem);

            // Start a timer to reset the color after 1 second
            Timer(Duration(milliseconds: 50), () {
              setState(() {
                isCartTappedList =
                    false; // Reset the tapped state for this button
              });
            });

            ElegantNotification(
              notificationPosition: NotificationPosition.topCenter,
              animation: AnimationType.fromTop,
              width: 360,
              height: 50,
              // title: const Text('Success!'),
              description: Text("${widget.shopItem.name} added to cart"),
              icon: const Icon(
                Icons.check_circle,
                color: Colors.black,
              ),
              progressIndicatorColor: Colors.black,
            ).show(context);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(left: 16, right: 16),
            width: 240,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "Add To Cart",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

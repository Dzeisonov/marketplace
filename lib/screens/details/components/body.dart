import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/constants.dart';
import 'package:marketplace/provider.dart';
import 'package:marketplace/sizeconfig.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final String imgPath;
  final String name;
  final double rating;
  final double price;
  final String description;

  const Body({
    Key? key,
    required this.imgPath,
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
  }) : super(key: key);

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
          _buildAppBar(rating: widget.rating),
          _buildProductImage(imgPath: widget.imgPath),
          Container(
            margin: EdgeInsets.only(
                top: getProportionateScreenWidth(20),
                bottom: getProportionateScreenWidth(20)),
            padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 2,
                    offset: Offset(0, -4),
                    blurRadius: 5,
                  ),
                ]),
            child: Column(
              children: [
                _buildProductDescription(
                  name: widget.name,
                  price: widget.price,
                  description: widget.description,
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
              widget.imgPath,
              widget.name,
              widget.rating,
              widget.price,
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
              description: Text("${widget.name} added to cart"),
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

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  Widget _buildAppBar({required double rating}) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              margin: EdgeInsets.only(right: 5, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    )
                  ]),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage({required String imgPath}) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(imgPath),
          ),
        ),
      ],
    );
  }

  Widget _buildProductDescription(
      {required String name,
      required double price,
      required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(35),
            right: getProportionateScreenWidth(35),
            top: 16,
          ),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            // maxLines: 3,
          ),
        ),
        SizedBox(height: 165),
        Padding(
          padding: EdgeInsets.only(left: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price: \$$price",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: dead_code

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
  bool isCartTapped = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isCartTapped ? Colors.grey : Colors.black;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildAppBar(rating: widget.rating),
              _buildProductImage(imgPath: widget.imgPath),
              Container(
                margin: EdgeInsets.only(
                    top: getProportionateScreenWidth(20),
                    bottom: getProportionateScreenWidth(20)),
                padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
                width: double.infinity,
                height: getProportionateScreenHeight(475),
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
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProductDescription(
                      name: widget.name,
                      description: widget.description,
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Price: \$${widget.price}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isCartTapped =
                                    true; // Set the tapped state for this button
                              });
                              CartItem cartItem = CartItem(
                                widget.imgPath,
                                widget.name,
                                widget.rating,
                                widget.price,
                                1,
                              );
                              final cartProvider = Provider.of<CartProvider>(
                                  context,
                                  listen: false);
                              cartProvider.addItemToCart(cartItem);

                              // Start a timer to reset the color after 1 second
                              Timer(Duration(milliseconds: 50), () {
                                setState(() {
                                  isCartTapped =
                                      false; // Reset the tapped state for this button
                                });
                              });

                              ElegantNotification(
                                notificationPosition:
                                    NotificationPosition.topCenter,
                                animation: AnimationType.fromTop,
                                width: 360,
                                height: 50,
                                // title: const Text('Success!'),
                                description:
                                    Text("${widget.name} added to cart"),
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
                                color: buttonColor,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
              height: getProportionateScreenWidth(50),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Colors.transparent,
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
      {required String name, required String description}) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isExpanded
                        ? description
                        : description.substring(0, 100) + ' ...',
                    maxLines: isExpanded ? null : 3,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          isExpanded ? 'See less' : 'See more',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: kTextColor),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          isExpanded ? Icons.arrow_back : Icons.arrow_forward,
                          size: 12,
                          color: kTextColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marketplace/components/default_button_black.dart';
import 'package:marketplace/provider.dart';
import 'package:marketplace/screens/paysuccess/payscs.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final CartItem? cartItem; // Make cartItem optional by adding '?'

  CartPage({this.cartItem, Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [];
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: cartItems.isEmpty
                        ? Center(
                            child: Text(
                              "Your cart is empty",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final cartItem = cartItems[index];
                              return _buildCartItem(cartItem);
                            },
                          ),
                  ),
                ),
                _priceAndContinue(cartItems),
              ],
            ),
          ),
        ));
  }

  Widget _buildCartItem(CartItem item) {
    return Dismissible(
      key: Key(item.name),
      onDismissed: (direction) {
        setState(() {
          if (item.amount > 1) {
            item.amount--;
          } else {
            // If the item amount is 1, remove it from the cartItems list
            final cartProvider =
                Provider.of<CartProvider>(context, listen: false);
            cartProvider.removeItemFromCart(item);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        height: 110,
        width: 400,
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: NetworkImage(item.image),
                      width: 90,
                      height: 90,
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 4, top: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Aligns item.name and item.price
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$" + item.price.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 15,
                              ),
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Text(
                                    item.rating.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
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
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (item.amount > 1) {
                          item.amount--; // Decrement item count if > 1
                        } else {
                          // If the item amount is 1, remove it from the cartItems list
                          final cartProvider =
                              Provider.of<CartProvider>(context, listen: false);
                          cartProvider.removeItemFromCart(item);
                        }
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 5),
                  Text(
                    item.amount.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        item.amount++; // Increment item count
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceAndContinue(List<CartItem> cartItems) {
    double totalPrice = 0;

    for (var item in cartItems) {
      totalPrice += item.price * item.amount;
    }

    return Container(
      width: 400,
      height: 110,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 394,
              height: 110,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 226,
            top: 17,
            child: Container(
              width: 400,
              height: 18,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                        width: 180,
                        height: 18,
                        child: Text(
                          'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 18,
            top: 52,
            child: DefaultButtonBlack(
                width: 343,
                text: "Checkout",
                press: () {
                  if (cartItems.isEmpty) {
                  } else {
                    final cartProvider =
                        Provider.of<CartProvider>(context, listen: false);
                    cartProvider.clearCart();
                    Navigator.pushNamed(
                      context,
                      PayScsScreen.routeName,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String image;
  final String name;
  final double rating;
  final double price;
  int amount;

  CartItem(
    this.image,
    this.name,
    this.rating,
    this.price,
    this.amount,
  );
}

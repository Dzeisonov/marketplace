import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/data.dart';
import 'package:marketplace/provider.dart';
import 'package:provider/provider.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  List<Color> cartCircleColors = [];

  @override
  void initState() {
    super.initState();

    // Initialize the color list with default colors
    for (int i = 0; i < ShopItem.combinedList.length; i++) {
      for (int j = 0; j < ShopItem.combinedList[i].length; j++) {
        cartCircleColors.add(Colors.black);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildItemContainer(ShopItem.combinedList),
        ],
      ),
    );
  }

  Widget _buildItemContainer(List<List<ShopItem>> data) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.016;

    List<Widget> rows = [];

    // Initialize itemIndex with 0
    int itemIndex = 0;

    // Iterate through each category (list) in data
    for (int rowIndex = 0; rowIndex < data.length; rowIndex++) {
      List<ShopItem> categoryItems = data[rowIndex];
      List<Widget> rowChildren = [];
      int itemsInCurrentRow = 0; // Keep track of items in the current row

      // Iterate through items in the category
      for (int colIndex = 0; colIndex < categoryItems.length; colIndex++) {
        // Calculate the linear index based on row and column indices
        int linearIndex = rowIndex * 2 + colIndex;

        // Access cartCircleColors using the linear index
        Color color = cartCircleColors[linearIndex];
        if (itemsInCurrentRow >= 2) {
          // Start a new row if two items are already in the current row
          rows.add(
            Row(
              children: rowChildren,
            ),
          );
          rowChildren = [];
          itemsInCurrentRow = 0;
        }

        ShopItem item = categoryItems[colIndex];
        rowChildren.add(
          _buildShopItem(linearIndex, item.imgPath, item.name, item.rating,
              item.price), // Pass the linearIndex
        );

        itemsInCurrentRow++; // Increment the count of items in the current row
        itemIndex++; // Increment the itemIndex
      }

      // Add the remaining items in the last row, if any
      if (rowChildren.isNotEmpty) {
        rows.add(
          Row(
            children: rowChildren,
          ),
        );
      }
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: containerWidth),
      child: Column(
        children: rows,
      ),
    );
  }

  Widget _buildShopItem(
      int index, String image, String name, double rating, double price) {
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
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Change the color when tapped based on the index
                        cartCircleColors[index] =
                            Colors.grey; // Replace with your desired color
                      });

                      CartItem cartItem =
                          CartItem(image, name, rating, price, 1);
                      final cartProvider =
                          Provider.of<CartProvider>(context, listen: false);
                      cartProvider.addItemToCart(cartItem);

                      // Revert the color change after 0.05 seconds
                      Future.delayed(Duration(milliseconds: 50), () {
                        setState(() {
                          cartCircleColors[index] =
                              Colors.black; // Revert to the default color
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
                        color: cartCircleColors[
                            index], // Set the color based on the index
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

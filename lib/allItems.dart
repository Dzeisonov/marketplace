import 'package:flutter/material.dart';
import 'package:marketplace/data.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
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

    // Iterate through each category (list) in data
    for (List<ShopItem> categoryItems in data) {
      List<Widget> rowChildren = [];
      int itemsInCurrentRow = 0; // Keep track of items in the current row

      // Iterate through items in the category
      for (int i = 0; i < categoryItems.length; i++) {
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

        ShopItem item = categoryItems[i];
        rowChildren.add(
          _buildShopItem(item.imgPath, item.name, item.rating, item.price),
        );

        itemsInCurrentRow++; // Increment the count of items in the current row
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    onTap: () {},
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

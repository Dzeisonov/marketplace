import 'package:flutter/material.dart';

class TrendScreen extends StatefulWidget {
  final String selectedCategory;
  const TrendScreen({Key? key, required this.selectedCategory}) : super(key: key);

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
          _buildItemContainer(),
        ],
      ),
    );
  }

Widget _buildItemContainer() {
  double screenWidth = MediaQuery.of(context).size.width;
  double containerWidth = screenWidth * 0.016;
  
  List<Widget> rows = [];
  switch (widget.selectedCategory) {
    case "Clothes":
      for (int i = 1; i <= 17; i++) {
        String imagePath1 = "lib/images/CLOTHES/SHIRT/SHIRT$i.jpg";
        String imagePath2 = "lib/images/CLOTHES/SHIRT/SHIRT${i + 1}.jpg";
        String itemName1 = "Shirt$i";
        String itemName2 = "Shirt${i + 1}";
        double itemPrice = 9.5;
        double itemDiscount = 3.99;

        Widget row = Row(
          children: [
            _buildShopItem(imagePath1, itemName1, itemPrice, itemDiscount),
            _buildShopItem(imagePath2, itemName2, itemPrice, itemDiscount),
            ],
          );
          rows.add(row);
          i++;
        }
      break;
      
    case "Shoes":
      for (int i = 1; i <= 6; i++) {
        String imagePath1 = "lib/images/CLOTHES/SHOES/SHOES$i.jpg";
        String imagePath2 = "lib/images/CLOTHES/SHOES/SHOES${i + 1}.jpg";
        String itemName1 = "Shoes$i";
        String itemName2 = "Shoes${i + 1}";
        double itemPrice = 9.5;
        double itemDiscount = 3.99;

        Widget row = Row(
          children: [
            _buildShopItem(imagePath1, itemName1, itemPrice, itemDiscount),
            _buildShopItem(imagePath2, itemName2, itemPrice, itemDiscount),
            ],
          );
          rows.add(row);
          i++;
        }
      break;
    case "Hats":
      for (int i = 1; i <= 7; i++) {
        String imagePath1 = "lib/images/CLOTHES/CAP/CAP$i.jpeg";
        String imagePath2 = "lib/images/CLOTHES/CAP/CAP${i + 1}.jpeg";
        String itemName1 = "CAP$i";
        String itemName2 = "CAP${i + 1}";
        double itemPrice = 9.5;
        double itemDiscount = 3.99;

        Widget row = Row(
          children: [
            _buildShopItem(imagePath1, itemName1, itemPrice, itemDiscount),
            _buildShopItem(imagePath2, itemName2, itemPrice, itemDiscount),
            ],
          );
          rows.add(row);
          i++;
        }
      break;
    case "Accessories":
      for (int i = 1; i <= 8; i++) {
        String imagePath1 = "lib/images/CLOTHES/ACCESSORIES/ACC$i.jpg";
        String imagePath2 = "lib/images/CLOTHES/ACCESSORIES/ACC${i + 1}.jpg";
        String itemName1 = "ACCESSORIES$i";
        String itemName2 = "ACCESSORIES${i + 1}";
        double itemPrice = 9.5;
        double itemDiscount = 3.99;

        Widget row = Row(
          children: [
            _buildShopItem(imagePath1, itemName1, itemPrice, itemDiscount),
            _buildShopItem(imagePath2, itemName2, itemPrice, itemDiscount),
            ],
          );
          rows.add(row);
          i++;
        }
      break;
    default:
      for (int i = 1; i <= 17; i++) {
        String imagePath1 = "lib/images/CLOTHES/SHIRT/SHIRT$i.jpg";
        String imagePath2 = "lib/images/CLOTHES/SHIRT/SHIRT${i + 1}.jpg";
        String itemName1 = "Shirt$i";
        String itemName2 = "Shirt${i + 1}";
        double itemPrice = 9.5;
        double itemDiscount = 3.99;

        Widget row = Row(
          children: [
            _buildShopItem(imagePath1, itemName1, itemPrice, itemDiscount),
            _buildShopItem(imagePath2, itemName2, itemPrice, itemDiscount),
            ],
          );
          rows.add(row);
          i++;
        }
      break;
  }
  // for (int i = 1; i <= 17; i++) {
    // String imagePath1 = "lib/images/CLOTHES/SHIRT/SHIRT$i.jpg";
    // String imagePath2 = "lib/images/CLOTHES/SHIRT/SHIRT${i + 1}.jpg";
    // String itemName1 = "Shirt$i";
    // String itemName2 = "Shirt${i + 1}";
    // double itemPrice = 9.5;
    // double itemDiscount = 3.99;

    // Widget row = Row(
    //   children: [
    //     _buildShopItem(imagePath1, itemName1, itemPrice, itemDiscount),
    //     _buildShopItem(imagePath2, itemName2, itemPrice, itemDiscount),
    //   ],
    // );

    // rows.add(row);
// 
    // i++;
  // }

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
                    "\$" + rating.toString(),
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
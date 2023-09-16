import 'package:flutter/material.dart';

class TrendScreen extends StatefulWidget {
  const TrendScreen({Key? key}) : super(key: key);

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade200,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildItemContainer(),
        ],
      ),
    );
  }

  Widget _buildItemContainer() {
    return Container(
      // alignment: Alignment.center,
      // child: SingleChildScrollView(
      // scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            children: [
              _buildShopItem("lib/images/tshirt.jpg", "T-Shirt1", 9.5, 3.99),
              _buildShopItem("lib/images/tshirt.jpg", "T-Shirt2", 9.5, 3.99),
            ],
          ),
          Row(
            children: [
              _buildShopItem("lib/images/tshirt.jpg", "T-Shirt1", 9.5, 3.99),
              _buildShopItem("lib/images/tshirt.jpg", "T-Shirt2", 9.5, 3.99),
            ],
          ),
          Row(
            children: [
              _buildShopItem("lib/images/tshirt.jpg", "T-Shirt1", 9.5, 3.99),
              _buildShopItem("lib/images/tshirt.jpg", "T-Shirt2", 9.5, 3.99),
            ],
          ),
          Row(
            children: [
              _buildShopItem("lib/images/tshirt.jpg", "T-Shirt1", 9.5, 3.99),
              _buildShopItem("lib/images/tshirt.jpg", "T-Shirt2", 9.5, 3.99),
            ],
          ),
        ],
      ),
      // ),
    );
  }

  Widget _buildShopItem(
      String image, String name, double rating, double price) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      height: 250,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color
        borderRadius: BorderRadius.circular(10), // Set the border-radius value
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
          padding: EdgeInsets.only(left: 10),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  rating.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$" + rating.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}

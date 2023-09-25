import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marketplace/accspage.dart';
import 'package:marketplace/allItemsPage.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/clothesPage.dart';
import 'package:marketplace/hatspage.dart';
import 'package:marketplace/data.dart';
import 'package:marketplace/provider.dart';
import 'package:marketplace/search.dart';
import 'package:marketplace/shoesPage.dart';
import 'package:marketplace/trendpage.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  static String routeName = "/homepage";

  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create separate lists of color variables for each section
  List<Color> trendingCartIconColors = [];
  List<Color> hatsCartIconColors = [];

  @override
  void initState() {
    super.initState();
    // Initialize the color lists with default colors
    trendingCartIconColors = List.generate(
      ShopItem.shopItemsTrend.length,
      (index) => Colors.black, // Initialize all to black for Trending section
    );
    hatsCartIconColors = List.generate(
      ShopItem.shopItemsHats.length,
      (index) => Colors.black, // Initialize all to black for Hats section
    );
  }

  // Function to handle the shopping cart icon tap for Trending section
  void handleTrendingCartIconTap(int index) {
    // Change the color of the specific shopping cart icon in the Trending section
    setState(() {
      trendingCartIconColors[index] = Colors.grey; // Change to grey or any color you prefer
    });

    // Use a Timer to change the color back to the original color after 1 second
    Timer(Duration(milliseconds: 50), () {
      setState(() {
        trendingCartIconColors[index] = Colors.black; // Change it back to black
      });
    });

    // Create a CartItem and add it to the cart
    CartItem cartItem = CartItem(
      ShopItem.shopItemsTrend[index].imgPath, // Use the appropriate image path
      ShopItem.shopItemsTrend[index].name,
      ShopItem.shopItemsTrend[index].rating,
      ShopItem.shopItemsTrend[index].price,
      1,
    );

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItemToCart(cartItem);
  }

  // Function to handle the shopping cart icon tap for Hats section
  void handleHatsCartIconTap(int index) {
    // Change the color of the specific shopping cart icon in the Hats section
    setState(() {
      hatsCartIconColors[index] = Colors.grey; // Change to grey or any color you prefer
    });

    // Use a Timer to change the color back to the original color after 1 second
    Timer(Duration(milliseconds: 50), () {
      setState(() {
        hatsCartIconColors[index] = Colors.black; // Change it back to black
      });
    });

    // Create a CartItem and add it to the cart
    CartItem cartItem = CartItem(
      ShopItem.shopItemsHats[index].imgPath, // Use the appropriate image path
      ShopItem.shopItemsHats[index].name,
      ShopItem.shopItemsHats[index].rating,
      ShopItem.shopItemsHats[index].price,
      1,
    );

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItemToCart(cartItem);
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              _buildSearchBar(),
              _buildHomePageUI(),
            ],
          ),
        ),
      ),
    );
  }
  // Method to build the search bar
Widget _buildSearchBar() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(color: Colors.black),
  );

  return Container(
    margin: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 10),
    alignment: Alignment.topCenter,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                offset: Offset(0, 3),
                blurRadius: 4,
                spreadRadius: -1,
              )
            ],
          ),
          child: TextField(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchBarA()));
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              hintText: "Search",
              suffixIcon: const Icon(Icons.search),
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _buildHomePageUI() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          _buildIconList(),
          SizedBox(height: 10),
          _buildCarouselSlide(),
          SizedBox(height: 10),
          _buildItemCategory(
            "Trending",
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return TrendPage();
                  },
                ),
              );
            },
          ),
          _buildItemContainer(
            ShopItem.shopItemsTrend,
            trendingCartIconColors, // Pass the color list for Trending section
            handleTrendingCartIconTap, // Pass the tap handling function
          ),
          _buildItemCategory(
            "Hats",
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HatsPage();
                  },
                ),
              );
            },
          ),
          _buildItemContainer(
            ShopItem.shopItemsHats,
            hatsCartIconColors, // Pass the color list for Hats section
            handleHatsCartIconTap, // Pass the tap handling function
          ),
        ]),
      ),
    );
  }

  // Method to build the icon list for categories
Widget _buildIconList() {
  List<String> categories = [
    "Category 1",
    "Category 2",
    "Category 3",
    "Category 4",
    "Category 5",
  ];

  List<String> categoryImages = [
    "lib/images/all.png",
    "lib/images/dress.png",
    "lib/images/shoe.png",
    "lib/images/cap.png",
    "lib/images/necklace.png",
  ];

  return Container(
    height: 150,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
              (index) {
                List<String> descriptions = [
                  "List all",
                  "Clothes",
                  "Shoes",
                  "Hats",
                  "Accessories",
                ];

                bool isFirstShape = index == 0;

                return GestureDetector(
                  onVerticalDragDown: (_) {
                    setState(() {});
                  },
                  onVerticalDragEnd: (_) {
                    setState(() {});
                  },
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          switch (categories[index]) {
                            case "Category 1":
                              return AllPage();
                            case "Category 2":
                              return ClothesPage();
                            case "Category 3":
                              return ShoesPage();
                            case "Category 4":
                              return HatsPage();
                            case "Category 5":
                              return AccsPage();
                            default:
                              return AllPage();
                          }
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 10.0),
                    child: Column(
                      children: [
                        Container(
                          width: 77,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: isFirstShape
                                ? BoxShape.circle
                                : BoxShape.rectangle,
                            borderRadius: isFirstShape
                                ? null
                                : BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              categoryImages[index],
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          descriptions[index],
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

// Method to build the carousel slider
Widget _buildCarouselSlide() {
  final imageAssets = [
    "lib/images/adds/offer1.jpg",
    "lib/images/adds/offer2.jpg",
    "lib/images/adds/offer3.jpg",
  ];

  double screenWidth = MediaQuery.of(context).size.width;
  double widths = screenWidth - 30;
  double heights = screenWidth * 8 / 18;

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    width: widths,
    height: heights,
    child: CarouselSlider.builder(
      itemCount: imageAssets.length,
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
      ),
      itemBuilder: (context, index, realIndex) {
        final imageAsset = imageAssets[index];

        return Container(
          width: widths,
          height: heights,
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
          ),
        );
      },
    ),
  );
}

// Method to build the item category with "See more" link
Widget _buildItemCategory(
  String title,
  Function() onTapCallback,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    alignment: Alignment.center,
    child: Column(children: [
      Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onTapCallback,
              child: Row(
                children: [
                  Text("See more",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(">",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ],
      ),
    ]),
  );
}





    Widget _buildItemContainer(List<ShopItem> data, List<Color> cartIconColors, Function(int) onTapCallback) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.016;

    List<Widget> rows = [];
    List<ShopItem> shopItems = List.from(data);

    while (shopItems.isNotEmpty) {
      List<Widget> rowChildren = [];

      while (shopItems.isNotEmpty) {
        ShopItem item = shopItems.removeAt(0);
        int index = rows.length + rowChildren.length;
        rowChildren.add(_buildShopItem(
            item.imgPath, item.name, item.rating, item.price, index, cartIconColors[index], onTapCallback));
      }

      rows.add(
        Row(
          children: rowChildren,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: containerWidth),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: rows,
        ),
      ),
    );
  }

  // Method to build a shop item widget
  Widget _buildShopItem(
      String image, String name, double rating, double price, int index, Color iconColor, Function(int) onTapCallback) {
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
                  GestureDetector(
                    onTap: () {
                      // Call the function to handle the tap and pass the index
                      onTapCallback(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: iconColor, // Use the color from the list
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
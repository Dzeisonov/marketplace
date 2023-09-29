import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marketplace/allItems.dart';
import 'package:marketplace/cart.dart';
import 'package:marketplace/categoryScreen.dart';
import 'package:marketplace/customPage.dart';
import 'package:marketplace/data.dart';
import 'package:marketplace/provider.dart';
import 'package:marketplace/screens/details/details_screen.dart';
import 'package:marketplace/search.dart';
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
  List<Color> trendingCartIconColors = [];
  List<Color> bestSellerCartIconColors = [];
  List<Color> shoesCartIconColors = [];

  @override
  void initState() {
    super.initState();
    trendingCartIconColors = List.generate(
      ShopItem.shopItemsTrend.length,
      (index) => Colors.black,
    );
    bestSellerCartIconColors = List.generate(
      ShopItem.shopItemsBestSeller.length,
      (index) => Colors.black,
    );
    shoesCartIconColors = List.generate(
      ShopItem.shopItemsShoes.length,
      (index) => Colors.black,
    );
  }

  ////////////////////////////

  void handleCartIconTap(
      int index, List<Color> cartIconColors, List<ShopItem> shopItems) {
    setState(() {
      cartIconColors[index] = Colors.grey;
    });

    Timer(Duration(milliseconds: 50), () {
      setState(() {
        cartIconColors[index] = Colors.black;
      });
    });

    CartItem cartItem = CartItem(
      shopItems[index].imgPath,
      shopItems[index].name,
      shopItems[index].rating,
      shopItems[index].price,
      1,
    );

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItemToCart(cartItem);
  }

  void _handleTrendingCartIconTap(int index) {
    handleCartIconTap(index, trendingCartIconColors, ShopItem.shopItemsTrend);
  }

  void _handleBestSellerCartIconTap(int index) {
    handleCartIconTap(
        index, bestSellerCartIconColors, ShopItem.shopItemsBestSeller);
  }

  void _handleShoesCartIconTap(int index) {
    handleCartIconTap(index, shoesCartIconColors, ShopItem.shopItemsShoes);
  }

  ////////////////////////////

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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchBarA()));
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

          //Penyederhanaan
          _buildCategory("Trending", ShopItem.shopItemsTrend,
              trendingCartIconColors, _handleTrendingCartIconTap),
          _buildCategory("Best Seller", ShopItem.shopItemsBestSeller,
              bestSellerCartIconColors, _handleBestSellerCartIconTap),
          _buildCategory("Shoes", ShopItem.shopItemsShoes, shoesCartIconColors,
              _handleShoesCartIconTap),
        ]),
      ),
    );
  }

  Widget _buildCategory(String title, List<ShopItem> items, List<Color> colors,
      Function(int) onTap) {
    return Column(
      children: [
        _buildItemCategory(title, () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CustomPage(
                  appBarTitle: title,
                  lastChild: CategoryScreen(shopItems: items),
                );
              },
            ),
          );
        }),
        _buildItemContainer(items, colors, onTap),
      ],
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
                                return CustomPage(
                                    appBarTitle: "All Items",
                                    lastChild: AllScreen());
                              case "Category 2":
                                return CustomPage(
                                    appBarTitle: "Clothes",
                                    lastChild: CategoryScreen(
                                        shopItems: ShopItem.shopItemsClothes));
                              case "Category 3":
                                return CustomPage(
                                    appBarTitle: "Shoes",
                                    lastChild: CategoryScreen(
                                        shopItems: ShopItem.shopItemsShoes));
                              case "Category 4":
                                return CustomPage(
                                    appBarTitle: "Hats",
                                    lastChild: CategoryScreen(
                                        shopItems: ShopItem.shopItemsHats));
                              case "Category 5":
                                return CustomPage(
                                    appBarTitle: "Accessories",
                                    lastChild: CategoryScreen(
                                        shopItems: ShopItem.shopItemsAcc));
                              default:
                                return CustomPage(
                                    appBarTitle: "All Items",
                                    lastChild: AllScreen());
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

// Define your different values for shopItemBestSeller
  List<List<ShopItem>> shopItemHome = [
    ShopItem.shopItemsTrend,
    ShopItem.shopItemsBestSeller,
    ShopItem.shopItemsShoes,
  ];

  Widget _buildItemContainer(List<ShopItem> data, List<Color> cartIconColors,
      Function(int) onTapCallback) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.016;

    // List<Widget> rows = [];

    List<Widget> rowChildren = [];

    for (int index = 0; index < data.length; index++) {
      ShopItem item = data[index];
      rowChildren.add(_buildShopItem(item.imgPath, item.name, item.rating,
          item.price, index, cartIconColors[index], onTapCallback, data));
    }

    //   rows.add(
    //     Row(
    //       children: rowChildren,
    //     ),
    //   );
    // }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: containerWidth),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: rowChildren,
        ),
      ),
    );
  }

  // Method to build a shop item widget
  Widget _buildShopItem(
      String image,
      String name,
      double rating,
      double price,
      int index,
      Color iconColor,
      Function(int) onTapCallback,
      List<ShopItem> shopItemHome) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(shopItem: shopItemHome[index]),
          ),
        );
      },
      child: Container(
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
                image: NetworkImage(image),
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
                        onTapCallback(index);
                        ElegantNotification(
                          notificationPosition: NotificationPosition.topCenter,
                          animation: AnimationType.fromTop,
                          width: 360,
                          height: 50,
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
                          color: iconColor,
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
      ),
    );
  }
}

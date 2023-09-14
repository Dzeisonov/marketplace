import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'category1_page.dart';
import 'category2_page.dart';
import 'category3_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade200,
        body: Container(
            child: Column(
          children: [
            SizedBox(height: 10),
            _buildSearchBar(),
            _buildHomePageUI(),
          ],
        )));
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
        _buildItemContainer(),
      ]),
    ));
  }

  Widget _buildSearchBar() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.orange),
    );

    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 25),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          TextField(
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
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////
  Widget _buildIconList() {
    List<String> categories = [
      "Category 1",
      "Category 2",
      "Category 3",
      "Category 4",
      "Category 5",
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
                    "Hat",
                    "Accessories",
                  ];

                  bool isFirstShape = index == 0;

                  return GestureDetector(
                    //NgeFix jika pas hover+scrolling di button langsung ke page lain
                    //Mungkin berguna? mungkin enggak
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
                            // Use the category name to select the right page
                            switch (categories[index]) {
                              case "Category 1":
                                return Category1Page();
                              case "Category 2":
                                return Category2Page();
                              case "Category 3":
                                return Category3Page();
                              // Add more cases for other categories
                              default:
                                return Category1Page(); // Default to Category 1 for now
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
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: isFirstShape
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                              borderRadius: isFirstShape
                                  ? null
                                  : BorderRadius.circular(12.0),
                              color: Colors.orange,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.rectangle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            descriptions[index],
                            style: TextStyle(fontSize: 12),
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

///////////////////////////////////////////////////////////////
  Widget _buildCarouselSlide() {
    final imageAssets = [
      "https://img.freepik.com/premium-vector/special-offer-sale-discount-banner_180786-46.jpg?w=2000",
      "https://img.freepik.com/premium-vector/special-offer-final-sale-banner-red-background-illustration_275806-121.jpg?w=2000",
      "https://img.freepik.com/free-vector/mega-sale-offers-banner-template_1017-31299.jpg?size=626&ext=jpg&ga=GA1.1.1154823071.1694689597&semt=ais"
    ];

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 400,
        height: 150,
        child: CarouselSlider.builder(
          itemCount: imageAssets.length,
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            autoPlay: true,
            viewportFraction: 1.0,
          ),
          itemBuilder: (context, index, realIndex) {
            final imageAsset = imageAssets[index];

            return _buildImage(imageAsset, index);
          },
        ));
  }

  Widget _buildImage(String imagesArr, int index) => Container(
          child: Image.network(
        imagesArr,
        fit: BoxFit.fill,
        height: 150,
        width: 400,
      ));

  Widget _buildItemContainer() {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                _buildShopItem("lib/images/tshirt.jpg", "T-Shirt1",
                    "This is a nice looking brown T-Shirt", 9.5, 3.99),
                _buildShopItem("lib/images/tshirt.jpg", "T-Shirt2",
                    "This is a nice looking brown T-Shirt", 9.5, 3.99)
              ],
            ),
            Row(
              children: [
                _buildShopItem("lib/images/tshirt.jpg", "T-Shirt1",
                    "This is a nice looking brown T-Shirt", 9.5, 3.99),
                _buildShopItem("lib/images/tshirt.jpg", "T-Shirt2",
                    "This is a nice looking brown T-Shirt", 9.5, 3.99)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShopItem(String image, String name, String description,
      double rating, double price) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$" + rating.toString(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ]),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 8),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ]),
    );
  }
}

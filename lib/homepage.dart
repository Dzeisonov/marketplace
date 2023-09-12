import 'package:flutter/material.dart';
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
            SizedBox(height: 20),
            _buildSearchBar(),
            _buildIconList(),
          ],
        ),
      ),
    );
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
      "Category 6",
      "Category 7",
      "Category 8",
      "Category 9",
      "Category 10",
    ];
    
    bool isScrolling = false;

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
                10,
                (index) {
                  List<String> descriptions = [
                    "List all",
                    "cat",
                    "pig",
                    "horse",
                    "bull",
                    "dog",
                    "7",
                    "8",
                    "9",
                    "10",
                  ];

                  bool isFirstShape = index == 0;

                  return GestureDetector(
                    //NgeFix jika pas hover+scrolling di button langsung ke page lain
                    //Mungkin berguna? mungkin enggak
                    onVerticalDragDown: (_) {
                      setState(() {
                        isScrolling = true;
                      });
                    },
                    onVerticalDragEnd: (_) {
                      setState(() {
                        isScrolling = false;
                      });
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
                              shape: isFirstShape ? BoxShape.circle : BoxShape.rectangle,
                              borderRadius: isFirstShape ? null : BorderRadius.circular(12.0),
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
}


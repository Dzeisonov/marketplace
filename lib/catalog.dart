import 'package:flutter/material.dart';
import 'package:marketplace/trend.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = "Clothes"; // Default category is Clothes

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    _tabController.addListener(() {
      _updateSelectedCategory(_tabController.index);
    });
  }

  // Function to update the selected category
  void _updateSelectedCategory(int index) {
    setState(() {
      switch (index) {
        case 0:
          selectedCategory = "Clothes";
          break;
        case 1:
          selectedCategory = "Shoes";
          break;
        case 2:
          selectedCategory = "Hats";
          break;
        case 3:
          selectedCategory = "Accessories";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: _buildSearchBar(context),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.black,
              indicatorWeight: 6,
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
              tabs: <Widget>[
                Tab(
                  child: _buildTab("Clothes"),
                ),
                Tab(
                  child: _buildTab("Shoes"),
                ),
                Tab(
                  child: _buildTab("Hats"),
                ),
                Tab(
                  child: _buildTab("Accessories"),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: TrendScreen(selectedCategory: selectedCategory),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.black),
    );
    return Builder(builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SearchBar()),
          );
        },
        child: Container(
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
      );
    });
  }

  Widget _buildTab(String tab) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 1.5,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Text(
        tab,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}


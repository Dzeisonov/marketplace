import 'package:flutter/material.dart';
import 'package:marketplace/trend.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabBarExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});
  // int page = 0;
  // TabBarExample(this.page);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, //page
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 110, // Adjust the expanded height as needed
              floating: false,
              pinned: false,
              flexibleSpace: Column(
                children: [
                  SizedBox(height: 4),
                  Flexible(
                    child:
                        _buildSearchBar(), // Place the search bar widget here
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TabBar(
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
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: TrendScreen(),
                  ),
                  Center(
                    child: TrendScreen(),
                  ),
                  Center(
                    child: TrendScreen(),
                  ),
                  Center(
                    child: TrendScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.black),
    );

    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 25),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Flexible(
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
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
          )),
      child: Text(
        tab,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

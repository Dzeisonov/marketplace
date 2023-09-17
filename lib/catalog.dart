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
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 100, // Adjust the expanded height as needed
              floating: false,
              pinned: false,
              flexibleSpace: Column(
                children: [
                  SizedBox(height: 4),
                  _buildSearchBar(), // Place the search bar widget here
                  SizedBox(
                    height: 10,
                  ),
                  TabBar(
                    indicatorColor: Colors.black,
                    indicatorWeight: 6,
                    tabs: <Widget>[
                      Tab(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 10),
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
                              )
                          ),
                          child: Text("Trending1",
                            style: TextStyle(color: Colors.black),
                              ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 10),
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
                              )
                          ),
                          child: Text("Trending2",
                            style: TextStyle(color: Colors.black),
                              ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 10),
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
                              )
                          ),
                          child: Text("Trending3",
                            style: TextStyle(color: Colors.black),
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: const TabBarView(
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
                ]
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
        ],
      ),
    );
  }
}

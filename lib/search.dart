import 'package:flutter/material.dart';
import 'package:marketplace/data.dart';

class SearchBarA extends StatefulWidget {
  const SearchBarA({Key? key}) : super(key: key);

  @override
  State<SearchBarA> createState() => _SearchBarAState();
}

class _SearchBarAState extends State<SearchBarA> {
  List<List<ShopItem>> shopItems = ShopItem.combinedList;
  List<ShopItem> displayList = [];
  List<ShopItem> originalList = [];

  @override
  void initState() {
    super.initState();
    // Flatten the nested shopItems list and initialize the displayList and originalList.
    displayList.addAll(shopItems.expand((list) => list));
    originalList.addAll(displayList);
  }

  void updateList(String value) {
    setState(() {
      if (value.isEmpty) {
        // If the search query is empty, revert to the original list.
        displayList.clear();
        displayList.addAll(originalList);
      } else {
        // Filter based on the search query.
        displayList = originalList
            .where(
              (item) => item.name.toLowerCase().contains(value.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          elevation: 0,
          titleSpacing: 0.0,
          title: Container(
            width: double.infinity, // Span the entire AppBar width
            padding: const EdgeInsets.only(
                left: 10.0, right: 30), // Adjust padding as needed
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(25.0), // Adjust the radius as needed
              child: TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none, // Remove the border
                  hintText: "e.g: T-Shirt",
                  hintStyle: TextStyle(fontSize: 16),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Add the boxShadow to the AppBar
          shadowColor: Colors.black.withOpacity(0.8),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  final item = displayList[index];
                  return ListTile(
                    contentPadding: EdgeInsets.all(8),
                    title: Text(item.name),
                    subtitle: Text("\$" + item.price.toString()),
                    trailing: Text("⭐ " + item.rating.toString()),
                    leading: Image.asset(
                      item.imgPath,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

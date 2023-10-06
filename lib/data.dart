import 'package:cloud_firestore/cloud_firestore.dart';

class ShopItem {
  final String imgPath;
  final String name;
  final double rating;
  final double price;
  final String description;

  ShopItem(this.imgPath, this.name, this.rating, this.price, this.description);

  static List<ShopItem> shopItemsTrend = [];
  static List<ShopItem> shopItemsShoes = [];
  static List<ShopItem> shopItemsHats = [];
  static List<ShopItem> shopItemsClothes = [];
  static List<ShopItem> shopItemsAcc = [];
  static List<ShopItem> shopItemsBestSeller = [];
  static List<List<ShopItem>> combinedList = [
    shopItemsAcc,
    shopItemsClothes,
    shopItemsShoes,
    shopItemsHats
  ];

  static Future<void> fetchData(String collect) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(collect) // Replace with your Firestore collection name
          .get();

      if (querySnapshot.size > 0) {
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          // Access data fields and create ShopItem objects
          String imgPath = document['imgPath'];
          String name = document['name'];
          double rating = document['rating'].toDouble();
          double price = document['price'].toDouble();
          String description = document['description'];
          String category = document['category'];

          // Create a new ShopItem and add it to the respective list
          ShopItem item = ShopItem(imgPath, name, rating, price, description);

          // Determine the category and add the item to the appropriate list
          if (category == 'trend') {
            shopItemsTrend.add(item);
          } else if (category == 'shoes') {
            shopItemsShoes.add(item);
          } else if (category == 'hats') {
            shopItemsHats.add(item);
          } else if (category == 'clothes') {
            shopItemsClothes.add(item);
          } else if (category == 'acc') {
            shopItemsAcc.add(item);
          } else if (category == 'best') {
            shopItemsBestSeller.add(item);
          }
        }
      } else {
        print('No documents found in Firestore');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
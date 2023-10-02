import 'package:cloud_firestore/cloud_firestore.dart';

class ShopItem {
  final String imgPath;
  final String name;
  final double rating;
  final double price;
  final String description;

  ShopItem(this.imgPath, this.name, this.rating, this.price, this.description);

  static List<ShopItem> shopItemsTrend = [
    // ShopItem("lib/images/clothes/shoes/SHOES1.jpg", "Shoes1", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/DRESS1.jpg", "Dress1", 9.5, 3.99),
    // ShopItem("lib/images/clothes/hats/CAP1.jpeg", "Hat1", 9.5, 3.99),
    // ShopItem("lib/images/clothes/shoes/SHOES2.jpg", "Shoes2", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/SHIRT4.jpg", "Shirt4", 9.5, 3.99),
    // ShopItem("lib/images/clothes/hats/CAP3.jpeg", "Hat3", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsShoes = [
    // ShopItem("lib/images/clothes/shoes/SHOES1.jpg", "Shoes1", 9.5, 3.99),
    // ShopItem("lib/images/clothes/shoes/SHOES2.jpg", "Shoes2", 9.5, 3.99),
    // ShopItem("lib/images/clothes/shoes/SHOES3.jpg", "Shoes3", 9.5, 3.99),
    // ShopItem("lib/images/clothes/shoes/SHOES4.jpg", "Shoes4", 9.5, 3.99),
    // ShopItem("lib/images/clothes/shoes/SHOES5.jpg", "Shoes5", 9.5, 3.99),
    // ShopItem("lib/images/clothes/shoes/SHOES6.jpg", "Shoes6", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsHats = [
    // ShopItem("lib/images/clothes/hats/CAP1.jpeg", "Hat1", 9.5, 3.99),
    // ShopItem("lib/images/clothes/hats/CAP2.jpeg", "Hat2", 9.5, 3.99),
    // ShopItem("lib/images/clothes/hats/CAP3.jpeg", "Hat3", 9.5, 3.99),
    // ShopItem("lib/images/clothes/hats/CAP4.jpeg", "Hat4", 9.5, 3.99),
    // ShopItem("lib/images/clothes/hats/CAP5.jpeg", "Hat5", 9.5, 3.99),
    // ShopItem("lib/images/clothes/hats/CAP6.jpeg", "Hat6", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsClothes = [
    // ShopItem("lib/images/clothes/clothes/SHIRT1.jpg", "Clothes1", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/SHIRT2.jpg", "Clothes2", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/SHIRT3.jpg", "Clothes3", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/SHIRT4.jpg", "Clothes4", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/SHIRT5.jpg", "Clothes5", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/SHIRT6.jpg", "Clothes6", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsAcc = [
    // ShopItem("lib/images/clothes/accs/ACC1.jpg", "Acc1", 9.5, 3.99),
    // ShopItem("lib/images/clothes/accs/ACC2.jpg", "Acc2", 9.5, 3.99),
    // ShopItem("lib/images/clothes/accs/ACC3.jpg", "Acc3", 9.5, 3.99),
    // ShopItem("lib/images/clothes/accs/ACC4.jpg", "Acc4", 9.5, 3.99),
    // ShopItem("lib/images/clothes/accs/ACC5.jpg", "Acc5", 9.5, 3.99),
    // ShopItem("lib/images/clothes/accs/ACC6.jpg", "Acc6", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsBestSeller = [
    // ShopItem("lib/images/clothes/shoes/SHOES4.jpg", "Shoes4", 9.5, 3.99),
    // ShopItem("lib/images/clothes/accs/ACC5.jpg", "Acc5", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/SHIRT1.jpg", "Clothes1", 9.5, 3.99),
    // ShopItem("lib/images/clothes/clothes/SHIRT2.jpg", "Clothes2", 9.5, 3.99),
    // ShopItem("lib/images/clothes/hats/CAP2.jpeg", "Hat2", 9.5, 3.99),
    // ShopItem("lib/images/clothes/shoes/SHOES6.jpg", "Shoes6", 9.5, 3.99),
  ];
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

// String description =
//     "Wearables that give you more confidence in your daily life. Our innovative devices are designed to boost your ...";

// String fullDesc =
//     "Wearables that give you more confidence in your daily life. Our innovative devices are designed to boost your self-assurance and empower you to take on every challenge with ease. Whether you're monitoring your health, or enhancing your personal style, our wearables provide the confidence you need to shine.";

class ShopItem {
  final String imgPath;
  final String name;
  final double rating;
  final double price;

  ShopItem(this.imgPath, this.name, this.rating, this.price);

  static List<ShopItem> shopItemsTrend = [
    ShopItem("lib/images/clothes/shoes/SHOES1.jpg", "Shoes1", 9.5, 3.99),
    ShopItem("lib/images/clothes/clothes/DRESS1.jpg", "Dress1", 9.5, 3.99),
    ShopItem("lib/images/clothes/hats/CAP1.jpeg", "Hat1", 9.5, 3.99),
    ShopItem("lib/images/clothes/shoes/SHOES2.jpg", "Shoes2", 9.5, 3.99),
    ShopItem("lib/images/clothes/clothes/SHIRT4.jpg", "Shirt4", 9.5, 3.99),
    ShopItem("lib/images/clothes/hats/CAP3.jpeg", "Hat3", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsShoes = [
    ShopItem("lib/images/clothes/shoes/SHOES1.jpg", "Shoes1", 9.5, 3.99),
    ShopItem("lib/images/clothes/shoes/SHOES2.jpg", "Shoes2", 9.5, 3.99),
    ShopItem("lib/images/clothes/shoes/SHOES3.jpg", "Shoes3", 9.5, 3.99),
    ShopItem("lib/images/clothes/shoes/SHOES4.jpg", "Shoes4", 9.5, 3.99),
    ShopItem("lib/images/clothes/shoes/SHOES5.jpg", "Shoes5", 9.5, 3.99),
    ShopItem("lib/images/clothes/shoes/SHOES6.jpg", "Shoes6", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsHats = [
    ShopItem("lib/images/clothes/hats/CAP1.jpeg", "Hat1", 9.5, 3.99),
    ShopItem("lib/images/clothes/hats/CAP2.jpeg", "Hat2", 9.5, 3.99),
    ShopItem("lib/images/clothes/hats/CAP3.jpeg", "Hat3", 9.5, 3.99),
    ShopItem("lib/images/clothes/hats/CAP4.jpeg", "Hat4", 9.5, 3.99),
    ShopItem("lib/images/clothes/hats/CAP5.jpeg", "Hat5", 9.5, 3.99),
    ShopItem("lib/images/clothes/hats/CAP6.jpeg", "Hat6", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsClothes = [
    ShopItem("lib/images/clothes/clothes/SHIRT1.jpg", "Clothes1", 9.5, 3.99),
    ShopItem("lib/images/clothes/clothes/SHIRT2.jpg", "Clothes2", 9.5, 3.99),
    ShopItem("lib/images/clothes/clothes/SHIRT3.jpg", "Clothes3", 9.5, 3.99),
    ShopItem("lib/images/clothes/clothes/SHIRT4.jpg", "Clothes4", 9.5, 3.99),
    ShopItem("lib/images/clothes/clothes/SHIRT5.jpg", "Clothes5", 9.5, 3.99),
    ShopItem("lib/images/clothes/clothes/SHIRT6.jpg", "Clothes6", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsAcc = [
    ShopItem("lib/images/clothes/accs/ACC1.jpg", "Acc1", 9.5, 3.99),
    ShopItem("lib/images/clothes/accs/ACC2.jpg", "Acc2", 9.5, 3.99),
    ShopItem("lib/images/clothes/accs/ACC3.jpg", "Acc3", 9.5, 3.99),
    ShopItem("lib/images/clothes/accs/ACC4.jpg", "Acc4", 9.5, 3.99),
    ShopItem("lib/images/clothes/accs/ACC5.jpg", "Acc5", 9.5, 3.99),
    ShopItem("lib/images/clothes/accs/ACC6.jpg", "Acc6", 9.5, 3.99),
  ];
  static List<List<ShopItem>> combinedList = [
    shopItemsAcc,
    shopItemsClothes,
    shopItemsShoes,
    shopItemsHats
  ];
}

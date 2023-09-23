class ShopItem {
  final String imgPath;
  final String name;
  final double rating;
  final double price;

  ShopItem(this.imgPath, this.name, this.rating, this.price);

  static List<ShopItem> shopItemsTrend = [
    ShopItem("lib/images/tshirt.jpg", "T-Shirt", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Cap", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Dress", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Shoes", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsShoes = [
    ShopItem("lib/images/tshirt.jpg", "Shoes", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Shoes1", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Shoes2", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Shoes3", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsHats = [
    ShopItem("lib/images/tshirt.jpg", "Hat", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Hat1", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Hat2", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Hat3", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsClothes = [
    ShopItem("lib/images/tshirt.jpg", "Clothes", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Clothes1", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Clothes2", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Clothes3", 9.5, 3.99),
  ];
  static List<ShopItem> shopItemsAcc = [
    ShopItem("lib/images/tshirt.jpg", "Acc", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Acc1", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Acc2", 9.5, 3.99),
    ShopItem("lib/images/tshirt.jpg", "Acc3", 9.5, 3.99),
  ];
  static List<List<ShopItem>> combinedList = [
    shopItemsAcc,
    shopItemsClothes,
    shopItemsShoes,
    shopItemsHats
  ];
}

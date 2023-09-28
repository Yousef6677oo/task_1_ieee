class CartDM {
  String? productName;
  String? imagePath;
  dynamic? price;
  String? id;
  bool isSelected= false;
  int quantity = 1;

  CartDM({
    required this.productName,
    required this.imagePath,
    required this.price,
    required this.id,
  });

  factory CartDM.fromMap(Map<dynamic, dynamic> map) {
    return CartDM(
      productName: map['productName'],
      imagePath: map['imagePath'],
      price: map['price'],
      id: map['id'],
    );
  }
}

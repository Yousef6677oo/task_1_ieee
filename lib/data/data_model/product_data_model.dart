class ProductDM {
  String? productName;
  String? description;
  String? imagePath;
  dynamic? price;
  List<dynamic>? listOfColors;
  dynamic? rating;
  bool? isFavorite;
  String? id;

  ProductDM({
    required this.productName,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.listOfColors,
    required this.rating,
    required this.isFavorite,
    required this.id,
  });

  factory ProductDM.fromMap(Map<dynamic, dynamic> map) {
    return ProductDM(
        productName: map['productName'],
        description: map['description'],
        imagePath: map['imagePath'],
        price: map['price'],
        listOfColors: map['listOfColors'],
        rating: map['rating'],
        isFavorite: map['isFavorite'],
        id: map['id']);
  }
}

class ProductDataModel {
  String? productName;
  String? description;
  double? price;
  List<String>? listOfColors;
  double? rating;
  bool? isFavorite;

  ProductDataModel({
    required this.productName,
    required this.description,
    required this.price,
    required this.listOfColors,
    required this.rating,
    required this.isFavorite,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_model/cart_data_model.dart';
import 'data_model/product_data_model.dart';

abstract class FirebaseManager {
  static Future<List<ProductDM>> getAllProducts() async {
    List<ProductDM> listOfAllProduct = [];
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("explore");
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var element in querySnapshot.docs) {
      listOfAllProduct.add(ProductDM.fromMap(element.data() as Map));
    }
    return listOfAllProduct;
  }

  static Future<void> addProductToFavorait(
      String id, bool stateOfSelected) async {
    CollectionReference todos =
        FirebaseFirestore.instance.collection('explore');
    DocumentReference doc = todos.doc(id);
    doc.update({
      "isFavorite": !stateOfSelected,
    });
  }

  static Future<void> addProductToCart(ProductDM product) async {
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection("cart");
    DocumentReference userDocument = userCollection.doc(product.id);
    userDocument.set({
      'productName': product.productName,
      'price': product.price,
      'imagePath': product.imagePath,
      'id': product.id,
    });
  }

  static Future<List<CartDM>> getProductsInCart() async {
    List<CartDM> listOfAllProductInCart = [];
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("cart");
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var element in querySnapshot.docs) {
      listOfAllProductInCart.add(CartDM.fromMap(element.data() as Map));
    }
    return listOfAllProductInCart;
  }
}

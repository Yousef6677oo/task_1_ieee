import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/data_model/cart_data_model.dart';
import 'package:task/data/firebase_manager.dart';

class CartViewModel extends Cubit<CartViewState> {
  CartViewModel() : super(InitialState());
  static List<CartDM> listOfAllProducts = [];

  Future<void> getProductsInCart() async {
    emit(LoadingState());
    try {
      listOfAllProducts = await FirebaseManager.getProductsInCart();
      emit(GetProductsSuccessState(listOfAllProducts: listOfAllProducts));
    } catch (ex) {
      emit(FailState());
    }
  }
}

abstract class CartViewState {}

class InitialState extends CartViewState {}

class LoadingState extends CartViewState {}

class GetProductsSuccessState extends CartViewState {
  List<CartDM> listOfAllProducts;

  GetProductsSuccessState({required this.listOfAllProducts});
}

class FailState extends CartViewState {}

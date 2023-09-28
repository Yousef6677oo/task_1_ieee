import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/data_model/product_data_model.dart';
import 'package:task/data/firebase_manager.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  HomeViewModel() : super(InitialState());
  static List<ProductDM> listOfAllProducts = [];

  Future<void> getAllProducts() async {
    emit(LoadingState());
    try {
      listOfAllProducts = await FirebaseManager.getAllProducts();
      emit(GetListOfProductSuccessState(listOfAllProducts: listOfAllProducts));
    } catch (ex) {
      emit(FailState());
    }
  }

  Future<void> changeFavorite(String id, bool stateOfSelected) async {
    emit(LoadingState());
    try {
      await FirebaseManager.addProductToFavorait(id, stateOfSelected);
      emit(ChangeFavoriteSuccessState());
    } catch (ex) {
      emit(FailState());
    }
  }

  Future<void> addProductToCart(ProductDM productDM) async {
    emit(LoadingState());
    try {
      await FirebaseManager.addProductToCart(productDM);
      emit(AddProductToCartSuccessState());
    } catch (ex) {
      emit(FailState());
    }
  }
}

abstract class HomeViewState {}

class InitialState extends HomeViewState {}

class LoadingState extends HomeViewState {}

class GetListOfProductSuccessState extends HomeViewState {
  List<ProductDM> listOfAllProducts;

  GetListOfProductSuccessState({required this.listOfAllProducts});
}

class ChangeFavoriteSuccessState extends HomeViewState {}

class AddProductToCartSuccessState extends HomeViewState {}

class FailState extends HomeViewState {}

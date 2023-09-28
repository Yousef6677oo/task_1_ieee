import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/firebase_manager.dart';

class ProductViewModel extends Cubit<ProductViewState> {
  ProductViewModel() : super(InitialState());

  Future<void> changeFavorite(String id, bool stateOfSelected) async {
    emit(LoadingState());
    try {
      await FirebaseManager.addProductToFavorait(id, stateOfSelected);
      emit(ChangeFavoriteSuccessState());
    } catch (ex) {
      emit(FailState());
    }
  }
}

abstract class ProductViewState {}

class InitialState extends ProductViewState {}

class LoadingState extends ProductViewState {}

class ChangeFavoriteSuccessState extends ProductViewState {}

class FailState extends ProductViewState {}

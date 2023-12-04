import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery/data/CartItems.dart';
import 'package:grocery/data/GroceryData.dart';
import 'package:grocery/data/WishlistItems.dart';
import 'package:grocery/features/home/model/ProductDetailsModel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>( homeProductCartButtonClickedEvent);
    on<HomeCardButtonNavigateEvent>(homeProductWishlistButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
      products: GroceryData.groceryProducts.map((product) => ProductDetailsModel.fromJson(product)).toList(),
    ));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint("Wishlist Button clicked");
    wishlistItems.add(event.productDetailsModel);
    emit(HomeAddProductToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint("Cart Button clicked");
    cartItems.add(event.productDetailsModel);
    emit(HomeAddProductToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(HomeCardButtonNavigateEvent event, Emitter<HomeState> emit) {
        debugPrint("Wishlist Button Navigate");
        emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint("Cart Button Navigate");
    emit(HomeNavigateToCartPageActionState());
  }

}

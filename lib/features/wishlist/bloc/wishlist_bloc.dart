import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery/data/WishlistItems.dart';
import 'package:meta/meta.dart';

import '../../home/model/ProductDetailsModel.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) {});
    on<WishlistInitialEvent>((event, emit) {
      print("Wishlist Initial EVent");
      emit(WishListSuccessState(wishlistItems: wishlistItems));
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeCardButtonNavigateEvent>((event, emit) => homeProductWishlistButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>((event, emit) => homeProductCartButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>((event, emit) => homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>((event, emit) => homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(HomeNavigateToWishlistPageActionState event, Emitter<HomeNavigateToWishlistPageActionState> emit){
    print("Wishlist Button Navigate");
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeNavigateToWishlistPageActionState event, Emitter<HomeNavigateToWishlistPageActionState> emit){
    print("Wishlist Button clicked");
}

  FutureOr<void> homeProductCartButtonNavigateEvent(HomeNavigateToCartPageActionState event, Emitter<HomeNavigateToCartPageActionState> emit){
    print("Cart Button Navigate");
  }

FutureOr<void> homeProductCartButtonClickedEvent(HomeNavigateToCartPageActionState event, Emitter<HomeNavigateToCartPageActionState> emit){
print("Cart Button clicked");
}
}

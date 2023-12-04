part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductDetailsModel productDetailsModel;
  HomeProductWishlistButtonClickedEvent({required this.productDetailsModel});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDetailsModel productDetailsModel;
  HomeProductCartButtonClickedEvent({required this.productDetailsModel});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent{}

class HomeCardButtonNavigateEvent extends HomeEvent{}




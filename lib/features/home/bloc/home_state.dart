part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  HomeLoadedSuccessState({required this.products});

  final List<ProductDetailsModel> products;
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeAddProductToWishlistPageActionState extends HomeActionState {}

class HomeAddProductToCartPageActionState extends HomeActionState {}

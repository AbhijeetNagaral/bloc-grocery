part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistActionState extends WishlistState {}

class WishListSuccessState  extends WishlistState{
  final List<ProductDetailsModel> wishlistItems;
  WishListSuccessState({required this.wishlistItems});
}

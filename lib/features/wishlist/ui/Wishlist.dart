import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/WishlistItems.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/ui/ProductTileWidget.dart';

import '../bloc/wishlist_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  WishlistBloc wishlistBloc = WishlistBloc();
  
  @override
  void initState() {
    // TODO: implement initState
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is !WishlistActionState,
      listener: (context, state) {},
      bloc: wishlistBloc,
      builder: (context, state) {
        switch(state.runtimeType){
          case WishListSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Wishlist"),
                backgroundColor: Colors.blueAccent,
              ),
              body: ListView.builder(
                  itemCount: wishlistItems.length,
                  itemBuilder: (context, index){
                    return ProductTileWidget(productDetailsModel: wishlistItems[index], homeBloc: HomeBloc());
                  }),
            );
          default:
            return const Center(child: Text("No Items Found."),);
        }
      },
    );
  }
}

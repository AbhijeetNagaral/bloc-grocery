import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/cart/ui/Cart.dart';
import 'package:grocery/features/home/ui/ProductTileWidget.dart';
import 'package:grocery/features/wishlist/ui/Wishlist.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (context, state) => state is HomeActionState,
      buildWhen: (context, state) => state is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Cart()));
        }
        else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Wishlist()));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return const Scaffold(body: Center(child: CircularProgressIndicator(),));

          case HomeLoadedSuccessState:
            final homeLoadedSuccessState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: const Text("Grocery App"),
                actions: [
                  IconButton(onPressed: (){
                    homeBloc.add(HomeCardButtonNavigateEvent());
                  }, icon: const Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                  }, icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: homeLoadedSuccessState.products.length,
                  itemBuilder: (context, index){
                    return ProductTileWidget(productDetailsModel: homeLoadedSuccessState.products[index], homeBloc: homeBloc,);
                  }),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}

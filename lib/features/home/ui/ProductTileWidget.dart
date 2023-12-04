import 'package:flutter/material.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/model/ProductDetailsModel.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDetailsModel productDetailsModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDetailsModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDetailsModel.imageUrl!))),
          ),
          const SizedBox(height: 20),
          Text(productDetailsModel.name!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productDetailsModel.description!),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${productDetailsModel.price}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          productDetailsModel: productDetailsModel
                        ));
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                          productDetailsModel: productDetailsModel
                        ));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
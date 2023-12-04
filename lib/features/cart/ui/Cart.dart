import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/cart/bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartBloc();
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      bloc: cartBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(),
        );
      },
    );
  }
}

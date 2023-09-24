import 'package:flutter/material.dart';
import 'package:flutter_application_7_bloc_learn/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_application_7_bloc_learn/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter_application_7_bloc_learn/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    super.initState();
    cartBloc.add(CartinitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        buildWhen: (previous, current) => current is! CartActionState,
        listenWhen: (previous, current) => current is CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                      productDataModel: successState.cartItems[index],
                      cartBloc: cartBloc);
                },
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_7_bloc_learn/features/cart/ui/cart.dart';
import 'package:flutter_application_7_bloc_learn/features/home/bloc/home_bloc.dart';
import 'package:flutter_application_7_bloc_learn/features/home/ui/product_tile_widget.dart';
import 'package:flutter_application_7_bloc_learn/features/wishlist/ui/wishlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Cart(),
              ));
        } else if (state is HomeNavigateToWishlistPageState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Wishlist(),
              ));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                centerTitle: true,
                title: Text('Grocery app'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishListNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomenavigateCartEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                      homeBloc: homeBloc,
                      productDataModel: successState.products[index]);
                },
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return Scaffold(
              body: SizedBox(),
            );
        }
      },
    );
  }
}

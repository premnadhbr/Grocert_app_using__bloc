import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_7_bloc_learn/data/cart_items.dart';
import 'package:flutter_application_7_bloc_learn/data/grocery_items.dart';
import 'package:flutter_application_7_bloc_learn/data/wishlist_items.dart';
import 'package:flutter_application_7_bloc_learn/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishListNavigateEvent>(homeWishListNavigateEvent);
    on<HomenavigateCartEvent>(homenavigateCartEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['url']))
            .toList()));
  }

  FutureOr<void> homeWishListNavigateEvent(
      HomeWishListNavigateEvent event, Emitter<HomeState> emit) {
    print('homeWishListNavigateEvent clicked');
    emit(HomeNavigateToWishlistPageState());
  }

  FutureOr<void> homenavigateCartEvent(
      HomenavigateCartEvent event, Emitter<HomeState> emit) {
    print('homenavigateCartEvent clicked');
    emit(HomeNavigateToCartPageState());
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Product clicked");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart product Clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }
}

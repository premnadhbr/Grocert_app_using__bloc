// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductWishListButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeWishListNavigateEvent extends HomeEvent {}

class HomenavigateCartEvent extends HomeEvent {}

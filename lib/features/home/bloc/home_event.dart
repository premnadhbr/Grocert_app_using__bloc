part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishListButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeWishListNavigateEvent extends HomeEvent {}

class HomenavigateCartEvent extends HomeEvent {}

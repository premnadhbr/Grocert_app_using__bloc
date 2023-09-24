// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartinitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({
    required this.productDataModel,
  });
}

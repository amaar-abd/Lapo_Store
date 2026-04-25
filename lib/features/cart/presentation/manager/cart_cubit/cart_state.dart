part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}


final class CartUpdated extends CartState {
  final List<ProductEntity> products;

  CartUpdated({required this.products});
}



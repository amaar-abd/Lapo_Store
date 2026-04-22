part of 'home_sales_cubit.dart';

sealed class HomeSalesState {}

final class HomeSalesInitial extends HomeSalesState {}

final class HomeSalesLoading extends HomeSalesState {}

final class HomeSalesSuccess extends HomeSalesState {
  final List<ProductEntity> products;

   HomeSalesSuccess({required this.products});
}

final class HomeSalesFailure extends HomeSalesState {
  final String message;

   HomeSalesFailure({required this.message});
}

import 'package:dartz/dartz.dart';
import 'package:lapo_app/core/errors/failures.dart';
import 'package:lapo_app/features/orders/data/models/order_item_model.dart';
import 'package:lapo_app/features/orders/data/models/order_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> uploadOrder(OrderModel order, List<OrderItemModel> items);
}
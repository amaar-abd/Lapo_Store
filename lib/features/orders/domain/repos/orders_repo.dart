import 'package:dartz/dartz.dart';
import 'package:lapo_app/core/errors/failures.dart';
import 'package:lapo_app/features/orders/domain/entites/order_entity.dart';
abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> fetchOrders(String userId);
}

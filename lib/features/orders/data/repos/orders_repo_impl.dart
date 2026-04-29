import 'package:dartz/dartz.dart';
import 'package:lapo_app/core/errors/failures.dart';
import 'package:lapo_app/features/orders/data/datasources/orders_data_source.dart';
import 'package:lapo_app/features/orders/domain/entites/order_entity.dart';
import 'package:lapo_app/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  OrdersRepoImpl({required this.ordersDataSource});
  final OrdersDataSource ordersDataSource;

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders(String userId) async {
    try {
      final orders = await ordersDataSource.getOrders(userId);
      return right(orders);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}

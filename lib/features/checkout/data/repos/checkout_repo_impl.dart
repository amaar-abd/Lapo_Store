import 'package:dartz/dartz.dart';
import 'package:lapo_app/core/errors/failures.dart';
import 'package:lapo_app/features/checkout/data/datasource/checkout_remote_data_source.dart';
import 'package:lapo_app/features/checkout/domain/repos/checkout_repo.dart';
import 'package:lapo_app/features/orders/data/models/order_item_model.dart';
import 'package:lapo_app/features/orders/data/models/order_model.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;

  CheckoutRepoImpl({required this.checkoutRemoteDataSource});
  @override
  Future<Either<Failure, void>> uploadOrder(
    OrderModel order,
    List<OrderItemModel> items,
  ) async {
    try {
      await checkoutRemoteDataSource.uploadOrder(order, items);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}

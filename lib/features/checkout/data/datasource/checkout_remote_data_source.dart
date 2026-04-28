import 'package:lapo_app/features/orders/data/models/order_item_model.dart';
import 'package:lapo_app/features/orders/data/models/order_model.dart';

abstract class CheckoutRemoteDataSource {
  Future<void> uploadOrder(OrderModel order, List<OrderItemModel> items);
}

import 'package:lapo_app/features/orders/data/models/order_model.dart';

abstract class OrdersDataSource {
  Future<List<OrderModel>> getOrders(String userId);
}
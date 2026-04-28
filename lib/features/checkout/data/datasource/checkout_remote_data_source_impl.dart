import 'package:lapo_app/core/constants/api_constants.dart';
import 'package:lapo_app/features/checkout/data/datasource/checkout_remote_data_source.dart';
import 'package:lapo_app/features/orders/data/models/order_item_model.dart';
import 'package:lapo_app/features/orders/data/models/order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  CheckoutRemoteDataSourceImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<void> uploadOrder(OrderModel order, List<OrderItemModel> items) async {
    final orderData = await supabaseClient
        .from(ApiConstants.orders)
        .insert(order.toJson())
        .select()
        .single();

    final orderId = orderData['id'];

    final itemsData = items.map((item) {
      return {
        'product_id': item.productId,
        'product_name': item.productName,
        'quantity': item.quantity,
        'price': item.price,
        'order_id': orderId,
      };
    }).toList();

    await supabaseClient.from(ApiConstants.orderitems).insert(itemsData);
  }
}

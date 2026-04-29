import 'package:lapo_app/core/constants/api_constants.dart';
import 'package:lapo_app/core/errors/custom_exception.dart';
import 'package:lapo_app/features/orders/data/datasources/orders_data_source.dart';
import 'package:lapo_app/features/orders/data/models/order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrdersDataSourceImpl implements OrdersDataSource {
  final SupabaseClient supabaseClient;

  OrdersDataSourceImpl({required this.supabaseClient});
  @override
  Future<List<OrderModel>> getOrders(String userId) async {
    try {
      final response = await supabaseClient
          .from(ApiConstants.orders)
          .select('*, ${ApiConstants.orderitems} (*)')
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      return response.map((order) => OrderModel.fromJson(order)).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}

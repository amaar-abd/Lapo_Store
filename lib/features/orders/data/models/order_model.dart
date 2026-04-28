import 'package:lapo_app/features/orders/domain/entites/order_entity.dart';
import 'order_item_model.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.uId,
    required super.fullName,
    required super.phone,
    required super.address,
    required super.city,
    required super.totalPrice,
    required super.status,
    required super.createdAt,
    required super.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uId: json['user_id'],
      fullName: json['full_name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      totalPrice: (json['total_price'] as num).toDouble(),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      items: (json['order_items'] as List? ?? [])
          .map((i) => OrderItemModel.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': uId,
      'full_name': fullName,
      'phone': phone,
      'address': address,
      'city': city,
      'total_price': totalPrice,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

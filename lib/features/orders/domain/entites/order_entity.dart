import 'order_item_entity.dart';

class OrderEntity {
  final String uId;
  final String fullName;
  final String phone;
  final String address;
  final String city;
  final double totalPrice;
  final String status;
  final DateTime createdAt;
  final List<OrderItemEntity> items;

  OrderEntity({
    required this.uId,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.city,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.items,
  });
}

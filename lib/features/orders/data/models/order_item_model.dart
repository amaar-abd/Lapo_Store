import 'package:lapo_app/features/orders/domain/entites/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.productId,
    required super.productName,
    required super.quantity,
    required super.price,
    super.imageUrl,
    super.orderId
  });


  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['product_id'],
      productName: json['product_name'] ?? '',
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['products']?['image_url'], 
      orderId: json['order_id']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      
      'product_id': productId,
      'product_name': productName,
      'quantity': quantity,
      'price': price,
      if (orderId != null) 'order_id': orderId
    };
  }
}
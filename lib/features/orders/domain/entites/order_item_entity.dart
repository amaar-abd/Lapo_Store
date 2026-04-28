class OrderItemEntity {
  final String productId;     
  final String productName;   
  final int quantity;         
  final double price;         
  final String? imageUrl; 
  final String? orderId;    

  OrderItemEntity({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.imageUrl,
    this.orderId
  });
}
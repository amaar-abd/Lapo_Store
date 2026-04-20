import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final num price;
  final String category;
  final bool isOnSale;
  final String imageUrl;
  final Map<String, String> specs;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.isOnSale,
    required this.imageUrl,
    required this.specs,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    price,
    category,
    isOnSale,
    imageUrl,
    specs,
  ];
}

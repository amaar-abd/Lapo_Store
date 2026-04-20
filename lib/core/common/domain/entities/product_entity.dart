import 'package:equatable/equatable.dart';
import 'package:lapo_app/core/common/domain/entities/product_specs_entity.dart';


class ProductEntity extends Equatable {
  final String id;
  final String name;
  final num price;
  final String category;
  final String brand;
  final bool isOnSale;
  final String imageUrl;
  final ProductSpecsEntity specs;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.brand,
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
    brand,
    isOnSale,
    imageUrl,
    specs,
  ];
}

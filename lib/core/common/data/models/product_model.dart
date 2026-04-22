import 'package:lapo_app/core/common/data/models/product_specs_model.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.category,
    required super.brand,
    required super.isOnSale,
    required super.imageUrl,
    required super.specs,
  });
  ProductSpecsModel get _specsModel => specs as ProductSpecsModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'] as num,
      category: json['category'],
      brand: json['brand'],
      isOnSale: json['is_on_sale'],
      imageUrl: json['image_url'],
      specs: ProductSpecsModel.fromJSon(
        Map<String, dynamic>.from(json['specs']),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'brand': brand,
      'is_on_sale': isOnSale,
      'image_url': imageUrl,
      'specs': _specsModel.specstoJson(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      category: category,
      brand: brand,
      isOnSale: isOnSale,
      imageUrl: imageUrl,
      specs: _specsModel.specsToEntity(),
    );
  }
}

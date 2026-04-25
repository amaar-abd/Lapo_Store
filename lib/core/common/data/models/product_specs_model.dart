import 'package:lapo_app/core/common/domain/entities/product_specs_entity.dart';

class ProductSpecsModel extends ProductSpecsEntity {
  const ProductSpecsModel({
    required super.cpu,
    required super.gpu,
    required super.ram,
    required super.storage,
    required super.screen,
    required super.battery,
  });

  factory ProductSpecsModel.fromJSon(Map<String, dynamic> json) {
    return ProductSpecsModel(
      cpu: json['cpu']?.toString() ?? '',
      gpu: json['gpu']?.toString() ?? '',
      ram: json['ram']?.toString() ?? '',
      storage: json['storage']?.toString() ?? '',
      screen: json['screen']?.toString() ?? '',
      battery: json['battery']?.toString() ?? '',
    );
  }
  factory ProductSpecsModel.fromEntity(ProductSpecsEntity entity) {
    return ProductSpecsModel(
      cpu: entity.cpu,
      gpu: entity.gpu,
      ram: entity.ram,
      storage: entity.storage,
      screen: entity.screen,
      battery: entity.battery,
    );
  }
  Map<String, dynamic> specstoJson() {
    return {
      'cpu': cpu,
      'gpu': gpu,
      'ram': ram,
      'storage': storage,
      'screen': screen,
      'battery': battery,
    };
  }

  ProductSpecsEntity specsToEntity() {
    return ProductSpecsEntity(
      cpu: cpu,
      gpu: gpu,
      ram: ram,
      storage: storage,
      screen: screen,
      battery: battery,
    );
  }
}

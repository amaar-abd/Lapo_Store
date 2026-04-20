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
      cpu: json['cpu'],
      gpu: json['gpu'],
      ram: json['ram'],
      storage: json['storage'],
      screen: json['screen'],
      battery: json['battery'],
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
}

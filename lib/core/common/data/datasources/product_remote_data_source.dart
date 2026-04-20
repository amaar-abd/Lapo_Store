import 'package:lapo_app/core/common/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getSalesProducts();

  Future<List<ProductModel>> getProductsByCategory({
    required String category,
  });
  Future<List<ProductModel>> getAllProducts();

  Future<List<ProductModel>> searchProductByName({
    required String query,
  });
}

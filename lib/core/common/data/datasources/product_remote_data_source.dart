import 'package:lapo_app/core/common/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getSalesProducts();

  Future<List<ProductModel>> getProductsByCategory({
     String? category,
  });


  Future<List<ProductModel>> searchProductByName({
    required String query,
  });
}

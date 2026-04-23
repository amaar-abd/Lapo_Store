import 'package:dartz/dartz.dart';
import 'package:lapo_app/core/common/data/datasources/product_remote_data_source.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/common/domain/repos/product_repo.dart';
import 'package:lapo_app/core/errors/failures.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({required this.productRemoteDataSource});
  final ProductRemoteDataSource productRemoteDataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getSalesProducts() async {
    try {
      final products = await productRemoteDataSource.getSalesProducts();
      return right(products.map((product) => product.toEntity()).toList());
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({
     String? category,
  }) async {
    try {
      final products = await productRemoteDataSource.getProductsByCategory(
        category: category,
      );
      return right(products.map((product) => product.toEntity()).toList());
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
    required String query,
  }) async {
    try {
      final products = await productRemoteDataSource.searchProductByName(
        query: query,
      );
      return right(products.map((product) => product.toEntity()).toList());
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}

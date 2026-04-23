import 'package:dartz/dartz.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getSalesProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
   { String? category}
  );
  Future<Either<Failure, List<ProductEntity>>> searchProducts({required String query});
}

import 'package:lapo_app/core/common/data/datasources/product_remote_data_source.dart';
import 'package:lapo_app/core/common/data/models/product_model.dart';
import 'package:lapo_app/core/constants/api_constants.dart';
import 'package:lapo_app/core/errors/custom_exception.dart';
import 'package:lapo_app/core/errors/supabase_error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<List<ProductModel>> getSalesProducts() async {
    try {
      final response = await supabaseClient
          .from(ApiConstants.productsTable)
          .select()
          .eq('is_on_sale', true);
      final data = List<Map<String, dynamic>>.from(response);

      return data.map((product) => ProductModel.fromJson(product)).toList();
    } on SupabaseError catch (e) {
      throw CustomException(message: e.toString());
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory({
    required String category,
  }) async {
    try {
      final response = await supabaseClient
          .from(ApiConstants.productsTable)
          .select()
          .eq('category', category);
      final data = List<Map<String, dynamic>>.from(response);

      return data.map((product) => ProductModel.fromJson(product)).toList();
    } on SupabaseError catch (e) {
      throw CustomException(message: e.toString());
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await supabaseClient
          .from(ApiConstants.productsTable)
          .select()
          .order('name');
      final data = List<Map<String, dynamic>>.from(response);

      return data.map((product) => ProductModel.fromJson(product)).toList();
    } on SupabaseError catch (e) {
      throw CustomException(message: e.toString());
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> searchProductByName({
    required String query,
  }) async {
    try {
      final response = await supabaseClient
          .from(ApiConstants.productsTable)
          .select()
          .ilike('name', '%$query%');
      final data = List<Map<String, dynamic>>.from(response);

      return data.map((product) => ProductModel.fromJson(product)).toList();
    } on SupabaseError catch (e) {
      throw CustomException(message: e.toString());
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}

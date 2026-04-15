import 'package:lapo_app/core/errors/custom_exception.dart';
import 'package:lapo_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lapo_app/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'display_name': name},
      );
      if (response.user == null) {
        throw Exception('Signup failed');
      }
      return UserModel.fromJson(response.user!.toJson());
    }on AuthException catch (e) {
    throw  ServerException(message: e.toString());
    }
  }
}

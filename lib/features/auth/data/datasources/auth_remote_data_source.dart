import 'package:lapo_app/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<void> setUserData({
    required String name,
    required String email,
    required String uId,
  });

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getUserData();

  Future<AuthResponse> signInWithGoogle();
}

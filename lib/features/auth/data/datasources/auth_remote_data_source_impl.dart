import 'package:google_sign_in/google_sign_in.dart';
import 'package:lapo_app/core/constants/api_constants.dart';
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
      setUserData(name: name, email: email, uId: response.user!.id);
      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> setUserData({
    required String name,
    required String email,
    required String uId,
  }) async {
    try {
      await supabaseClient.from(ApiConstants.userTable).insert({
        'id': uId,
        'name': name,
        'email': email,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw ServerException(message: 'signin failed');
      }
      return UserModel.fromJson(response.user!.toJson());
    } on AuthApiException catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> getUserData() async {
    final seesion = supabaseClient.auth.currentSession;
    if (seesion != null) {
      final userData = await supabaseClient
          .from(ApiConstants.userTable)
          .select()
          .eq('id', seesion.user.id)
          .single();
      return UserModel.fromJson(userData);
    }
    return null;
  }

  @override
  Future<AuthResponse> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        serverClientId: ApiConstants.googleWebClientId,
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw CustomException(message: 'Google sign in cancelled');
      }

      final googleAuth = await googleUser.authentication;

      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
        accessToken: googleAuth.accessToken,
      );
      return response;
    } catch (e) {
      throw CustomException(message: 'error in AuthRemoteDataSource $e');
    }
  }

  @override
  Future<UserModel> signInWithGitHub() async {
    try {
      await supabaseClient.auth.signInWithOAuth(
        OAuthProvider.github,
        redirectTo: ApiConstants.supabaseRedirectUrl,
      );
      final user = supabaseClient.auth.currentUser;
      if (user != null) {
        return UserModel.fromJson(user.toJson());
      } else {
        throw ServerException(message: 'signin failed');
      }
    } catch (e) {
      throw CustomException(message: 'error in AuthRemoteDataSource $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
     throw CustomException(message: e.toString());
    }
  }
}

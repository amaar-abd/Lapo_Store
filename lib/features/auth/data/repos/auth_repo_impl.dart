import 'package:dartz/dartz.dart';
import 'package:lapo_app/core/errors/custom_exception.dart';
import 'package:lapo_app/core/errors/supabase_error.dart';
import 'package:lapo_app/core/errors/failures.dart';
import 'package:lapo_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lapo_app/features/auth/domain/entities/user_entity.dart';
import 'package:lapo_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userEntity = await authRemoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );

      return right(userEntity);
    } on ServerException catch (e) {
      return left(
        ServerFailure(message: SupabaseError.mapSupabaseError(e.message)),
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userEntity = await authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(userEntity);
    } on ServerException catch (e) {
      return left(
        ServerFailure(message: SupabaseError.mapSupabaseError(e.message)),
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}

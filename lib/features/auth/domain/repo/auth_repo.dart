import 'package:dartz/dartz.dart';
import 'package:lapo_app/core/errors/failures.dart';
import 'package:lapo_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}

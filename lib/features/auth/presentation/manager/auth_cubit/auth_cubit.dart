import 'package:bloc/bloc.dart';
import 'package:lapo_app/features/auth/domain/entities/user_entity.dart';
import 'package:lapo_app/features/auth/domain/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  void checkAuth() async {
    final result = await authRepo.getUserData();

    result.fold(
      (failure) => emit(UserLoggedOut()),
      (user) => emit(UserLoggedIn(user)),
    );
  }

  Future<void> googleSignIn() async {
    emit(AuthLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (user) => emit(AuthSuccess(userEntity: user)),
    );
  }

  Future<void> signInWithGitHub() async {
    emit(AuthLoading());
    final result = await authRepo.signInWithGitHub();
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (user) => emit(AuthSuccess(userEntity: user)),
    );
  }

  Future<void> logout() async {
    final result = await authRepo.signOut();

    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(UserLoggedOut()),
    );
  }
}

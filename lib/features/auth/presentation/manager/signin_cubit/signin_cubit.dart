import 'package:bloc/bloc.dart';
import 'package:lapo_app/features/auth/domain/repo/auth_repo.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signin({required String email, required String password}) async {
    emit(SigninLoading());

    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess()),
    );
  }
}

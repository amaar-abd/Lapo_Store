import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/features/auth/domain/repo/auth_repo.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.signUpWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userentity) => emit(SignupSuccess()),
    );
  }
}

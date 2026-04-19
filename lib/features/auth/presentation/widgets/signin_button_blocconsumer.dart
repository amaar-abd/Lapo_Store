import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/presentation/widgets/custom_snackbar.dart';
import 'package:lapo_app/core/presentation/widgets/mian_button.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';

class SigninButtonBlocconsumer extends StatelessWidget {
  const SigninButtonBlocconsumer({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.onValidationError,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onValidationError;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          customSnackBar(context, 'Login successful', AppColors.success);
          Navigator.of(context).pushReplacementNamed(AppRoutes.mainView);
        }
        if (state is SigninFailure) {
          customSnackBar(context, state.message, AppColors.errorRed);
        }
      },
      builder: (context, state) {
        final isLoaging = state is SigninLoading;
        return MainButton(
          onPressed: isLoaging
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
                    context.read<SigninCubit>().signin(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } else {
                    onValidationError();
                  }
                },
          text: isLoaging ? null : 'LOGIN',
          widget: isLoaging
              ? const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                )
              : null,
        );
      },
    );
  }
}

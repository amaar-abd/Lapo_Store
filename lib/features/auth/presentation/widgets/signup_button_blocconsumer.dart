import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/presentation/widgets/custom_snackbar.dart';
import 'package:lapo_app/core/presentation/widgets/mian_button.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';

class SignupButtonBlocconsumer extends StatelessWidget {
  const SignupButtonBlocconsumer({
    super.key,
    required this.isChecked,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.onValidationError,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onValidationError;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          customSnackBar(
            context,
            'Account created successfully',
            AppColors.success,
          );
          Navigator.of(context).pop();
        }
        if (state is SignupFailure) {
          customSnackBar(context, state.message, AppColors.errorRed);
        }
      },
      builder: (context, state) {
        final isLoaging = state is SignupLoading;
        return MainButton(
          onPressed: isLoaging
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
                    if (isChecked) {
                      context.read<SignupCubit>().signup(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } else {
                      customSnackBar(
                        context,
                        'Please accept the terms',
                        AppColors.errorRed,
                      );
                    }
                  } else {
                    onValidationError();
                  }
                },
          text: isLoaging ? null : 'CREATE ACCOUNT',
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

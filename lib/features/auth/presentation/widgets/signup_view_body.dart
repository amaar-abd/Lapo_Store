import 'package:flutter/material.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/auth/presentation/widgets/signup_auth_container.dart';
import 'package:lapo_app/features/auth/presentation/widgets/user_question_row.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Join the future.',
                style: TextTheme.of(context).displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Experience luxury in every transaction.',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(color: AppColors.textSecondary),
              ),
              SizedBox(height: height * 0.04),
              SignupAuthContainer(
                formKey: formKey,
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                onValidationError: () {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                },
              ),
              SizedBox(height: height * 0.06),
              UserQuestionRow(
                mainAxisAlignment: MainAxisAlignment.center,
                ask: 'Already have an account ? ',
                answer: 'Login',
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.loginView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

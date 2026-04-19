import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/presentation/widgets/custom_snackbar.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:lapo_app/features/auth/presentation/widgets/signin_auth_container.dart';
import 'package:lapo_app/features/auth/presentation/widgets/top_par_widget.dart';
import 'package:lapo_app/features/auth/presentation/widgets/user_question_row.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
        child: BlocConsumer<AuthCubit, AuthState>(
          buildWhen: (previous, current) =>
              current is AuthInitial ||
              current is AuthLoading ||
              current is AuthSuccess ||
              current is AuthFailure,
          listener: (context, state) {
            if (state is AuthFailure) {
              null;
            } else if (state is AuthSuccess) {
              customSnackBar(context, 'login successful', AppColors.success);
              Navigator.of(context).pushReplacementNamed(AppRoutes.mainView);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AuthLoading,
              opacity: 0.2,
              color: Colors.black, 
              progressIndicator: const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(color: AppColors.accentCyan),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopParWidget(),
                    SizedBox(height: height * 0.03),
                    SigninAuthContainer(
                      formKey: _formKey,
                      emailcontroller: emailController,
                      passwordcontroller: passwordController,
                      onValidationError: () {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      },
                    ),
                    SizedBox(height: height * 0.04),
                    UserQuestionRow(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.signupView);
                      },
                      mainAxisAlignment: MainAxisAlignment.center,
                      ask: 'Don\'t have an account ? ',
                      answer: 'Sign Up',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

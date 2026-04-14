import 'package:flutter/material.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/features/auth/presentation/widgets/signin_auth_container.dart';
import 'package:lapo_app/features/auth/presentation/widgets/top_par_widget.dart';
import 'package:lapo_app/features/auth/presentation/widgets/user_question_row.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopParWidget(),
              SizedBox(height: height * 0.03),
              SigninAuthContainer(
                emailcontroller: emailController,
                passwordcontroller: passwordController,
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
      ),
    );
  }
}

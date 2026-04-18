import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/features/auth/domain/repo/auth_repo.dart';
import 'package:lapo_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:lapo_app/features/auth/presentation/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignupCubit(sl.get<AuthRepo>()),
          child: SignupViewBody(),
        ),
      ),
      appBar: AppBar(),
    );
  }
}

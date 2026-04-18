import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/features/auth/domain/repo/auth_repo.dart';
import 'package:lapo_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:lapo_app/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:lapo_app/features/auth/presentation/widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SigninCubit(sl.get<AuthRepo>())),
            BlocProvider(create: (context) => sl.get<AuthCubit>()),
          ],
          child: SigninViewBody(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/app_images.dart';
import 'package:lapo_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          current is UserLoggedIn ||
          current is UserLoggedOut ||
          current is AuthInitial,
      builder: (context, state) {
        if (state is UserLoggedIn) {
          final user = state.user;
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  //navigator to profile view
                },
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(Assets.assetsImagesUserrr),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WELCOME BACK',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.accentCyan),
                        ),
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.surfaceCard.withAlpha(150),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_on_outlined,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is AuthLoading) {
          return const CircularProgressIndicator();
        } else {
          return Text("State is: $state");
        }
      },
    );
  }
}

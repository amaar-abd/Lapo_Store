import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/app_images.dart';
import 'package:lapo_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:lapo_app/features/profile/presentation/widgets/log_out_button.dart';
import 'package:lapo_app/features/profile/presentation/widgets/profile_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    if (authState is UserLoggedIn|| authState is AuthSuccess) {
      final user = (authState is UserLoggedIn) 
                 ? authState.user 
                 : (authState as AuthSuccess).userEntity;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(

          children: [
            const SizedBox(height: 16),
            Image.asset(Assets.assetsImagesUserrr,width: 100,),
            const SizedBox(height: 10),
            Text(
             user.name,
              style: TextTheme.of(context).bodyLarge?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
          user.email,
              style: TextTheme.of(context).bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ProfileItem(
              title: 'Wishlist',
              icon: Icon(Icons.favorite, color: AppColors.accentCyan),
            ),
            const SizedBox(height: 10),
            ProfileItem(
              title: 'Payment Methods',
              icon: Icon(Icons.payment_outlined, color: AppColors.accentCyan),
            ),
            const SizedBox(height: 10),
            ProfileItem(
              title: 'Settings',
              icon: Icon(Icons.settings, color: AppColors.accentCyan),
            ),
            Spacer(),
            LogOutButton(),
            const SizedBox(height: 20),
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(color: AppColors.accentCyan),
      );
    }
  }
}

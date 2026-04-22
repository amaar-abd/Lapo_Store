import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/services/cache_helper.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/app_images.dart';
import 'package:lapo_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserLoggedIn) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.mainView);
        } else {
          Navigator.of(context).pushReplacementNamed(AppRoutes.loginView);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    Assets.assetsImagesSplashGradient,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            Assets.assetsImagesSplash3608189284164304,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(Assets.assetsImagesSplashHeading),
                      SizedBox(height: 10),
                      Text(
                        'PRECISION PERFORAMANCE',
                        style: TextTheme.of(context).bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                          letterSpacing: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  navigateToNextScreen() {
    Future.delayed(Duration(seconds: 2), () async {
      final bool isOnboardingVisited =
          await CacheHelper.getData(key: 'isOnboardingVisited') ?? false;
      if (isOnboardingVisited) {
        context.read<AuthCubit>().checkAuth();
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingView);
      }
    });
  }
}

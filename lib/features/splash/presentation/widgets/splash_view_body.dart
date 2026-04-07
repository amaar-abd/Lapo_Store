import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/app_iamges.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Image.asset(
                Assets.assetsImagesSplachGradient,
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
                      child: Image.asset(Assets.assetsImagesSplach3608189284164304),
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(Assets.assetsImagesSplachHeading),
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
  }
}

import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/app_images.dart';

class BeforeSrarchView extends StatelessWidget {
  const BeforeSrarchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Image.asset(Assets.assetsImagesSearshLap),
        SizedBox(height: 30),
        Text(
          'FIND YOUR PERFECT LAPTOP',
          textAlign: TextAlign.center,
          style: TextTheme.of(context).bodyLarge?.copyWith(letterSpacing: 2,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/app_images.dart';

class NoSeaechResultsView extends StatelessWidget {
  const NoSeaechResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
      Image.asset(Assets.assetsImagesNotFoundLaptop),SizedBox(height: 30,),
      SizedBox(height: 30),
      Text('NO LAPTOP FOUND',style: TextTheme.of(context).bodyLarge?.copyWith(color: AppColors.textPrimary,fontWeight: FontWeight.bold,letterSpacing: 2,),)
    ]);
  }
}

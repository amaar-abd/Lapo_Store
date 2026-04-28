import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
        ),
        Text(
          'Checkout',
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.abc, size: 50, color: AppColors.primaryBackground),
      ],
    );
  }
}

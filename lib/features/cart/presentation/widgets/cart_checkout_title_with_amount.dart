import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class CartCheckoutTitleWithAmount extends StatelessWidget {
  const CartCheckoutTitleWithAmount({super.key, required this.title, required this.amount});
final String title;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextTheme.of(context).bodyMedium?.copyWith(color: AppColors.textSecondary,fontWeight: FontWeight.bold)
          ),
          Text(
            '\$ ${amount.toStringAsFixed(2)}',
            style: TextTheme.of(context).bodyMedium?.copyWith(color: AppColors.textPrimary,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

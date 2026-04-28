import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class BuildPriceSummaryRow extends StatelessWidget {
  const BuildPriceSummaryRow({
    super.key,
    required this.label,
    required this.price,
  });
  final String label;
  final String price;
  final bool isTotal = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextTheme.of(context).bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
          ),
          Text(
            price,
            style: TextTheme.of(context).bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
          ),
        ],
      ),
    );
  }
}

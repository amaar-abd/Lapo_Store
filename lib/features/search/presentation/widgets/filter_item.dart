import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.onTap,
    required this.title,
    this.titleColor,
    this.backgroundColor,
  });
  final void Function() onTap;
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration( 
          color: backgroundColor ?? AppColors.surfaceCard.withAlpha(180),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextTheme.of(context).bodyMedium?.copyWith(
              color: titleColor ?? AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class MethodDeliveryItem extends StatelessWidget {
  const MethodDeliveryItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.isSelected, 
    required this.onTap,
  });
  final String title;
  final String subTitle;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceCard.withAlpha(180),
          borderRadius: BorderRadius.circular(20),
          border: BoxBorder.all(
            color: isSelected ? AppColors.accentCyan : AppColors.textSecondary,
            width: 1,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: AppColors.textSecondary, size: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextTheme.of(context).bodyLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subTitle,
                    style: TextTheme.of(context).bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.accentCyan
                        : AppColors.textSecondary,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.accentCyan,
                          shape: BoxShape.circle,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

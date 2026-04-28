import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({
    super.key,
    required this.title,
    required this.number,
    required this.isDone,
    required this.isCurrent,
  });
  final String title;
  final String number;
  final bool isDone;
  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isCurrent || isDone
              ? AppColors.accentCyan
              : AppColors.surfaceCard.withAlpha(180),
          child: isDone || isCurrent
              ? const Icon(Icons.check, color: AppColors.primaryBackground)
              : Text(
                  number,
                  style: TextTheme.of(
                    context,
                  ).bodyLarge?.copyWith(color: AppColors.textPrimary),
                ),
        ),
        SizedBox(height: 7),
        Text(
          title,
          style: TextTheme.of(
            context,
          ).bodySmall?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

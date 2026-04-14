import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class Ordivider extends StatelessWidget {
  const Ordivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        const SizedBox(width: 18),
        Text(
          'OR CONTINUE WITH',
          style: TextTheme.of(
            context,
          ).bodyMedium?.copyWith(fontSize: 12, color: AppColors.textSecondary),
        ),
        const SizedBox(width: 18),
        Expanded(child: Divider()),
      ],
    );
  }
}

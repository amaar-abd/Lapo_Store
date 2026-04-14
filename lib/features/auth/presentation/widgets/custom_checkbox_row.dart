import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class CustomCheckboxRow extends StatelessWidget {
  const CustomCheckboxRow({super.key, this.value, this.onChanged});
  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.accentCyan,
        ),
        RichText(
          text: TextSpan(
            style: TextTheme.of(
              context,
            ).bodyMedium?.copyWith(color: AppColors.textSecondary),
            children: [
              TextSpan(text: 'By signing up, you agree to our '),
              TextSpan(
                text: 'Terms\n ',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.accentCyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: 'and '),
              TextSpan(
                text: 'Privacy',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.accentCyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

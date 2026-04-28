import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class BuildInfoAddressRow extends StatelessWidget {
  const BuildInfoAddressRow({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
              text: "$label: ",
              style: TextTheme.of(context).bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
            ),
            TextSpan(
              text: value,
              style: TextTheme.of(context).bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pathIcon,
  });
  final String title;
  final String subtitle;
  final String pathIcon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryBackground.withAlpha(1),
      child: ListTile(
        leading: SizedBox(
          height: 40,
          width: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.surfaceCard,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(pathIcon),
            ),
          ),
        ),
        title: Text(
          title,
          style: TextTheme.of(context).bodySmall?.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextTheme.of(context).bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

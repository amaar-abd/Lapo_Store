import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.title, required this.icon});
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceCard.withAlpha(150),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textSecondary.withAlpha(50)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextTheme.of(context).bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.textSecondary.withAlpha(40),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(padding: const EdgeInsets.all(6), child: icon),
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/profile/presentation/widgets/show_log_out_dialog.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 300,
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ShowLogOutDialog(),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.errorRed.withAlpha(80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log Out',
              style: TextTheme.of(context).bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.logout, color: AppColors.textPrimary),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/onboarding/presentation/widgets/skip_button.dart';

class TopTitleRow extends StatelessWidget {
  const TopTitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Expanded(flex: 1,child: const SizedBox()),
        Expanded(flex: 2,
          child: Text(
            'LAPO STORE',
            style: TextTheme.of(context).bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 5,
            ),
          ),
        ),
       Expanded(flex: 1,child:const SkipButton())
      ],
    );
  }
}

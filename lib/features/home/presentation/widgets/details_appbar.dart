import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class DetailsAppbar extends StatelessWidget {
  const DetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surfaceCard.withAlpha(100),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surfaceCard.withAlpha(100),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline_sharp, color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}

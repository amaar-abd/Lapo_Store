import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    this.onPressed,
    required this.pathIcon,
    this.isSelected = false,
  });
  final String title;
  final String pathIcon;
  final void Function()? onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isSelected
            ? AppColors.accentCyan
            : AppColors.surfaceCard,
        padding: EdgeInsets.symmetric(horizontal: 13),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            pathIcon,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.black : AppColors.textSecondary,
              BlendMode.srcIn,
            ),
            height: 14,
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: TextTheme.of(context).bodyMedium?.copyWith(
              color: isSelected
                  ? AppColors.primaryBackground
                  : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

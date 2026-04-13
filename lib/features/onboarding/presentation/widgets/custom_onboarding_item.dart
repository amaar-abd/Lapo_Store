import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/mian_button.dart';
import 'package:lapo_app/features/onboarding/presentation/widgets/top_title_row.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.pageController,
    required this.pageIndex,
  });
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;
  final PageController pageController;
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          const SizedBox(height: 8),
          const TopTitleRow(),
          SizedBox(height: height * 0.04),
          Image.asset(imageUrl),
          SizedBox(height: height * 0.02),
          Text(title, style: TextTheme.of(context).displayLarge),
          const SizedBox(height: 6),
          Text(
            
            subTitle,
            style: TextTheme.of(
              context,
            ).displayLarge?.copyWith(color: AppColors.accentCyan),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: width * 0.90,
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: TextTheme.of(
                context,
              ).bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
          ),
          SizedBox(height: height * 0.02),
          DotsIndicator(
            dotsCount: 2,
            position: pageIndex.toDouble(),
            decorator: DotsDecorator(
              color: pageIndex == 1
                  ? AppColors.accentCyan
                  : AppColors.textSecondary.withAlpha(120),
              activeColor: AppColors.accentCyan,
            ),
          ),
          SizedBox(height: height * 0.02),
          Spacer(),
          MainButton(
            onPressed: () {
              if (pageIndex == 0) {
                pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                Navigator.of(context).pushReplacementNamed(AppRoutes.loginView);
              }
            },
            text: pageIndex == 0 ? 'Continue' : 'Get Started',
          ),
          SizedBox(height: height * 0.04),
        ],
      ),
    );
  }
}

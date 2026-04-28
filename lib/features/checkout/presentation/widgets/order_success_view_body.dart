import 'package:flutter/material.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/app_images.dart';

class OrderSuccessViewBody extends StatefulWidget {
  const OrderSuccessViewBody({super.key});

  @override
  State<OrderSuccessViewBody> createState() => _OrderSuccessViewBodyState();
}

class _OrderSuccessViewBodyState extends State<OrderSuccessViewBody> {
  @override
  void initState() {
    super.initState();
    backToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ORDER SUCCESS',
                style: TextTheme.of(
                  context,
                ).bodyLarge?.copyWith(color: AppColors.accentCyan),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.assetsImagesSuccess),
              const  SizedBox(height: 20),
                Text(
                  'Payment Successful',
                  style: TextTheme.of(context).displaySmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void backToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.mainView,
        (route) => false,
      );
    });
  }
}

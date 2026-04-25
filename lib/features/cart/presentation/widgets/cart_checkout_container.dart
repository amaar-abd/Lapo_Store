import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:lapo_app/features/cart/presentation/widgets/cart_checkout_title_with_amount.dart';

class CartCheckoutContainer extends StatelessWidget {
  const CartCheckoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColors.surfaceCard.withAlpha(150),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: Column(
        children: [
          CartCheckoutTitleWithAmount(
            title: 'Subtotal',
            amount: context.watch<CartCubit>().getTotalPrice(),
          ),
          CartCheckoutTitleWithAmount(title: 'Shipping', amount: 10),
          Dash(dashColor: Colors.grey, length: 380),
          CartCheckoutTitleWithAmount(
            title: 'Total Amount',
            amount: context.watch<CartCubit>().getTotalPrice() + 10,
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentCyan,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.checkoutView);
                },
                child: Text(
                  'CHECKOUT',
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: AppColors.primaryBackground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

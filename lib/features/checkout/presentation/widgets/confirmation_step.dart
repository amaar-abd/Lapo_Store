import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/price_summary_card.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/shipping_address_card.dart';


class ConfirmationStep extends StatelessWidget {
  const ConfirmationStep({
    super.key,
    required this.nameController,
    required this.addressController,
    required this.cityController,
    required this.zipController,
    required this.phoneController,
  });
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController zipController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Text(
          'Order  Summary',
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),
    ShippingAddressCard(name: nameController.text, phone: phoneController.text, fullAddress: addressController
    .text),const SizedBox(height: 25),
    PriceSummaryCard(subtotal: context.read<CartCubit>().getTotalPrice(), shippingFee: 10)
      ],
    );
  }
}

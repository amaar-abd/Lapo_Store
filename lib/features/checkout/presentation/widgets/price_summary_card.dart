import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/build_price_summary_row.dart';

class PriceSummaryCard extends StatelessWidget {
  const PriceSummaryCard({
    super.key,
    required this.subtotal,
    required this.shippingFee,
  });
  final double subtotal;
  final double shippingFee;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard.withAlpha(180),
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          BuildPriceSummaryRow(label: 'Subtotal', price: "$subtotal\$"),
          BuildPriceSummaryRow(label: 'Shipping Fee', price: "$shippingFee\$"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          BuildPriceSummaryRow(
            label: 'Total Amount',
            price: "${subtotal + shippingFee}\$",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/method_delivery_item.dart';

class DeliverySelectionStep extends StatelessWidget {
  const DeliverySelectionStep({
    super.key,
    required this.selectedDeliveryIndex,
    required this.onSelectDelivery,
  });
  final int? selectedDeliveryIndex;
  final Function(int) onSelectDelivery;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text(
          'Delivery  Method',
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        MethodDeliveryItem(
          title: 'Express Delivery',
          subTitle: 'Cach on delivery',
          icon: Icons.local_shipping,
          isSelected: selectedDeliveryIndex == 0,
          onTap: () => onSelectDelivery(0),
        ),
        const SizedBox(height: 25),
        MethodDeliveryItem(
          title: 'In-Store Pickup',
          subTitle: 'Hand Payment',
          icon: Icons.handshake_rounded,
          isSelected: selectedDeliveryIndex == 1,
          onTap:() => onSelectDelivery(1),
        ),
      ],
    );
  }
}

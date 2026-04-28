import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/build_Info_address_row.dart';

class ShippingAddressCard extends StatelessWidget {
  final String name;
  final String phone;
  final String fullAddress;

  const ShippingAddressCard({
    super.key,
    required this.name,
    required this.phone,
    required this.fullAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surfaceCard.withAlpha(180),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.surfaceCard.withAlpha(180)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 8),
                Text(
                  "Shipping Address",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            BuildInfoAddressRow(label: 'Name', value: name),
            BuildInfoAddressRow(label: 'Phone', value: phone),
            BuildInfoAddressRow(label: 'Address', value: fullAddress),
          ],
        ),
      ),
    );
  }
}

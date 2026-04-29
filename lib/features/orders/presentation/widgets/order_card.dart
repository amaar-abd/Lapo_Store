import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/orders/domain/entites/order_entity.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    final int totalQuantity = order.items.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard.withAlpha(180),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order # ${order.uId.toString().substring(0, 10)} ',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.accentCyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildStatusBadge(context, order.status),
            ],
          ),
          const Divider(color: Colors.white10, height: 24),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey[400]),
              const SizedBox(width: 8),
              Text(
                DateFormat('dd MMM yyyy, hh:mm a').format(order.createdAt),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$totalQuantity Items',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                NumberFormat.currency(
                  symbol: '\$',
                  decimalDigits: 0,
                  locale: 'en_US',
                ).format(order.totalPrice),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildStatusBadge(BuildContext context, String status) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: status == 'delivered'
          ? Colors.green.withAlpha(50)
          : AppColors.accentCyan.withAlpha(50),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: status == 'delivered' ? Colors.green : AppColors.accentCyan,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

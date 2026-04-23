import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.15,
          width: width * 0.45,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textSecondary.withAlpha(50)),
            color: Colors.black.withAlpha(5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.surfaceCard.withAlpha(20),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.accentCyan,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          maxLines: 1,
          product.brand,
          style: TextTheme.of(context).bodyMedium?.copyWith(
            color: AppColors.accentCyan,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          product.name,
          style: TextTheme.of(context).bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          ' ${NumberFormat.currency(symbol: '\$', decimalDigits: product.price % 1 == 0 ? 0 : 3, locale: 'en_US').format(product.price)}',
          style: TextTheme.of(context).bodyMedium?.copyWith(
            color: AppColors.accentCyan,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

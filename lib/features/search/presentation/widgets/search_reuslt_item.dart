import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/theme/app_colors.dart';

class SearchReusltItem extends StatelessWidget {
  const SearchReusltItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(AppRoutes.detailsView, arguments: product);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(20),
          border: BoxBorder.all(color: AppColors.textSecondary.withAlpha(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        fit: BoxFit.contain,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                              color: AppColors.accentCyan,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ${NumberFormat.currency(symbol: '\$', decimalDigits: product.price % 1 == 0 ? 0 : 3, locale: 'en_US').format(product.price)}',
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: AppColors.accentCyan,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.specs.cpu,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.specs.gpu,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

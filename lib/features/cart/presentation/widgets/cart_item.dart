import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lapo_app/core/common/data/models/product_model.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:lapo_app/features/cart/presentation/widgets/counter_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.accentCyan,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().removeFromCart(product.id);
                        },
                        icon: Icon(Icons.delete, color: AppColors.errorRed),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (product.price * product.quantity) % 1 == 0
                            ? NumberFormat.currency(
                                symbol: '\$',
                                decimalDigits: 0,
                                locale: 'en_US',
                              ).format(product.price * product.quantity)
                            : NumberFormat.currency(
                                symbol: '\$',
                                decimalDigits: 3,
                                locale: 'en_US',
                              ).format(product.price * product.quantity),
                        style: TextTheme.of(context).bodySmall?.copyWith(
                          color: AppColors.accentCyan,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CounterWidget(
                        value: product.quantity,
                        increment: () {
                          context.read<CartCubit>().incrementQuantity(
                            ProductModel.fromEntity(product),
                          );
                        },
                        decrement: () {
                          context.read<CartCubit>().decrementQuantity(
                            ProductModel.fromEntity(product),
                          );
                        },
                      ),
                    ],
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

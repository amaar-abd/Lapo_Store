import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/utils/app_images.dart';
import 'package:lapo_app/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:lapo_app/features/home/presentation/widgets/details_appbar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: height * .40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(top: 5, left: 10, right: 10, child: DetailsAppbar()),
          ],
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  product.name,
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.025),
                CustomListTile(
                  title: 'PROCESSOR',
                  subtitle: product.specs.cpu,
                  pathIcon: Assets.assetsImagesCpuIcon,
                ),
                SizedBox(height: 8),
                CustomListTile(
                  title: 'GRAPHICS',
                  subtitle: product.specs.gpu,
                  pathIcon: Assets.assetsImagesGpuIcon,
                ),
                SizedBox(height: 8),
                CustomListTile(
                  title: 'MEMORY',
                  subtitle: product.specs.ram,
                  pathIcon: Assets.assetsImagesRamIcon,
                ),
                SizedBox(height: 8),
                CustomListTile(
                  title: 'STORAGE',
                  subtitle: product.specs.storage,
                  pathIcon: Assets.assetsImagesHardIcon,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' ${NumberFormat.currency(symbol: '\$', decimalDigits: product.price % 1 == 0 ? 0 : 3, locale: 'en_US').format(product.price)}',
                      style: TextTheme.of(context).bodyLarge?.copyWith(
                        color: AppColors.accentCyan,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.accentCyan,
                      ),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.cartPlus,
                            color: Colors.black,
                          ),
                          SizedBox(width: 2),
                          Text(
                            'ADD TO CART',
                            style: TextTheme.of(context).bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

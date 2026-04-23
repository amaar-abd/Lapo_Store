import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/home/presentation/widgets/carousel_slider_home.dart';
import 'package:lapo_app/features/home/presentation/widgets/categories_grid_view.dart';
import 'package:lapo_app/features/home/presentation/widgets/categories_list.dart';
import 'package:lapo_app/features/home/presentation/widgets/custom_appbar_home.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbarHome(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deal Of The Day',
                  style: TextTheme.of(
                    context,
                  ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'VIEW ALL',
                  style: TextTheme.of(context).bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentCyan,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CarouselSliderHome(),
            SizedBox(height: 15),
            Text(
              'Categories',
              style: TextTheme.of(
                context,
              ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CategoriesList(),
            SizedBox(height: 15),
            CategoriesGridView()
            
          ],
        ),
      ),
    );
  }
}

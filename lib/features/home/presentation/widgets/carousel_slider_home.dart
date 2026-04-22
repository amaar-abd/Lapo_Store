import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/home/presentation/manager/sales_cubit/home_sales_cubit.dart';

class CarouselSliderHome extends StatelessWidget {
  const CarouselSliderHome({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSalesCubit, HomeSalesState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        if (state is HomeSalesLoading) {
          return SizedBox(
            width: double.infinity,
            height: size.height * .28,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.accentCyan),
            ),
          );
        } else if (state is HomeSalesSuccess) {
          final products = state.products;
          return CarouselSlider.builder(
            options: CarouselOptions(
              height: size.height * .28,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: .97,
            ),

            itemCount: products.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: GestureDetector(
                        onTap: () {
                          //
                        },
                        child: CachedNetworkImage(
                          imageUrl: products[index].imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorWidget: (context, url, error) => Image.asset(''),
                          placeholder: (context, url) => Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.accentCyan,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              '20% OFF',
                              style: TextTheme.of(context).bodyMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          products[index].name,
                          style: TextTheme.of(
                            context,
                          ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   '20% Off Today',
                        //   style: TextTheme.of(context).bodyLarge?.copyWith(
                        //     color: AppColors.accentCyan,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // SizedBox(height: 5),
                        Text(
                          products[index].specs.cpu,
                          style: TextTheme.of(context).bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          products[index].specs.ram,
                          style: TextTheme.of(context).bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 25),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.accentCyan,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Shop Now',
                            style: TextTheme.of(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBackground,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is HomeSalesFailure) {
          return Text(state.message);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

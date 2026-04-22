import 'package:flutter/material.dart';
import 'package:lapo_app/features/home/presentation/widgets/carousel_slider_home.dart';
import 'package:lapo_app/features/home/presentation/widgets/custom_appbar_home.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbarHome(),
          SizedBox(height: 10),
          Text(
            'Deal Of The Day',
            style: TextTheme.of(
              context,
            ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          CarouselSliderHome(),
        ],
      ),
    );
  }
}

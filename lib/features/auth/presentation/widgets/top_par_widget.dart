import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lapo_app/core/utils/app_images.dart';

class TopParWidget extends StatelessWidget {
  const TopParWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.assetsImagesTopParIcon, width: 100),
        Text(
          'LAPO STOPE',
          style: TextTheme.of(
            context,
          ).bodyLarge?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
      ],
    );
  }
}

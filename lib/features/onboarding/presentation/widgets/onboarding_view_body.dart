import 'package:flutter/material.dart';
import 'package:lapo_app/core/utils/app_images.dart';
import 'package:lapo_app/features/onboarding/presentation/widgets/custom_onboarding_item.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});
  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        pageIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        CustomOnboardingItem(
          pageController: pageController,
          pageIndex: pageIndex,
          imageUrl: Assets.assetsImagesOnboardingOnboardingImage1,
          title: 'High-End',
          subTitle: 'Performance',
          description:
              'Discover the power of next-gen\nlaptops for word and play',
        ),
        CustomOnboardingItem(
          pageController: pageController,
          pageIndex: pageIndex,
          imageUrl: Assets.assetsImagesOnboardingOnboardingImage2,
          title: 'Next-Gen',
          subTitle: 'Performance',
          description:
              'Experience the pinnacle of high-end\ncomputing with our cutated boutique',
        ),
      ],
    );
  }
}

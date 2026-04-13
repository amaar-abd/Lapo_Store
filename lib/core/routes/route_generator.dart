import 'package:flutter/material.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:lapo_app/features/splash/presentation/views/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case AppRoutes.onboardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}

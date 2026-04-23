import 'package:flutter/material.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/features/auth/presentation/views/signin_view.dart';
import 'package:lapo_app/features/auth/presentation/views/signup_view.dart';
import 'package:lapo_app/features/home/presentation/views/details_view.dart';
import 'package:lapo_app/features/main_layout/presentation/widgets/main_view_body.dart';
import 'package:lapo_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:lapo_app/features/splash/presentation/views/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case AppRoutes.onboardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (context) => const SigninView());
      case AppRoutes.signupView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case AppRoutes.mainView:
        return MaterialPageRoute(builder: (context) => const MainViewBody());
      case AppRoutes.detailsView:
      final args = settings.arguments;
        return MaterialPageRoute(builder: (context) =>  DetailsView(product: args as ProductEntity,
          
        ));

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}

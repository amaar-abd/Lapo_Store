import 'package:flutter/material.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/routes/route_generator.dart';
import 'package:lapo_app/core/theme/app_theme.dart';

void main() {
  runApp(const LapoApp());
}

class LapoApp extends StatelessWidget {
  const LapoApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lapo app',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: AppRoutes.splashView,
      theme: AppTheme.mainTheme,
      debugShowCheckedModeBanner: false,
      );
  }
}

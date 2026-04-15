import 'package:flutter/material.dart';
import 'package:lapo_app/core/constants/api_constants.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/routes/route_generator.dart';
import 'package:lapo_app/core/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: ApiConstants.supabaseUrl,
    anonKey: ApiConstants.supabaseAnonKey,
  );
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

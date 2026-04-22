import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/constants/api_constants.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/routes/route_generator.dart';
import 'package:lapo_app/core/services/cache_helper.dart';
import 'package:lapo_app/core/theme/app_theme.dart';
import 'package:lapo_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.sharedPreferencesInit();
  await Supabase.initialize(
    url: ApiConstants.supabaseUrl,
    anonKey: ApiConstants.supabaseAnonKey,
  );
  getItInit();
  runApp(const LapoApp());
}

class LapoApp extends StatelessWidget {
const LapoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<AuthCubit>()..checkAuth(),
      child: MaterialApp(
        title: 'lapo app',
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        initialRoute: AppRoutes.splashView,
        theme: AppTheme.mainTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/common/domain/repos/product_repo.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:lapo_app/features/home/presentation/manager/sales_cubit/home_sales_cubit.dart';
import 'package:lapo_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeSalesCubit(sl.get<ProductRepo>())..featchSalesProduct()),
        BlocProvider(create: (context) => CategoryCubit(sl.get<ProductRepo>())..getProducts())
        
        ],
      child: const HomeViewBody(),
    );
  }
}

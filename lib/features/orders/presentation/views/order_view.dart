import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/orders/domain/repos/orders_repo.dart';
import 'package:lapo_app/features/orders/presentation/manager/orders_cubit/orders_cubit.dart';
import 'package:lapo_app/features/orders/presentation/widgets/orders_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(sl.get<OrdersRepo>())..getOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ORDERS',
            style: TextTheme.of(context).bodyLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        body: const OrdersViewBody(),
      ),
    );
  }
}

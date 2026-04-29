import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/common/widgets/custom_snackbar.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/core/routes/app_routes.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:lapo_app/features/checkout/domain/repos/checkout_repo.dart';
import 'package:lapo_app/features/checkout/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => CheckoutCubit(sl.get<CheckoutRepo>()),
        child: BlocListener<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutSuccess) {
              Navigator.of(context).pop();
              context.read<CartCubit>().clearCart();
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamedAndRemoveUntil(
                AppRoutes.orderSuccessView,
                (route) => false,
              );
            } else if (state is CheckoutFailure) {
              Navigator.of(context).pop();
              customSnackBar(context, state.message, AppColors.errorRed);
            } else if (state is CheckoutLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => PopScope(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceCard,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const CircularProgressIndicator(
                        color: Color(0xFF00D2FF),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
          child: SafeArea(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}

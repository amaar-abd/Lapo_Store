import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/order_success_view_body.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

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
      body: SafeArea(child: OrderSuccessViewBody()),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lapo_app/features/cart/presentation/widgets/cart_list_bloc_builder.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),

        Expanded(child: CartListBlocBuilder()),
      ],
    );
  }
}

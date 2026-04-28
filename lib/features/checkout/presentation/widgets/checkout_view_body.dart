import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lapo_app/core/common/widgets/custom_snackbar.dart';
import 'package:lapo_app/core/common/widgets/mian_button.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:lapo_app/features/checkout/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/checkout_appbar.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/checkout_pages_view.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/step_tracker.dart';
import 'package:lapo_app/features/orders/data/models/order_item_model.dart';
import 'package:lapo_app/features/orders/data/models/order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  late final TextEditingController nameController;
  late final TextEditingController addressController;
  late final TextEditingController cityController;
  late final TextEditingController zipController;
  late final TextEditingController phoneController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int currentPage = 0;
  @override
  void initState() {
    nameController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    zipController = TextEditingController();
    phoneController = TextEditingController();
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipController.dispose();
    phoneController.dispose();
    pageController.dispose();
    valueNotifier.dispose();
  }

  int? selectedDeliveryIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          CheckoutAppBar(),
          SizedBox(height: 14),
          StepTracker(currentPage: currentPage),
          Expanded(
            child: CheckoutPagesView(
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              pageController: pageController,
              valueListenable: valueNotifier,
              formkey: formkey,
              addressController: addressController,
              cityController: cityController,
              nameController: nameController,
              phoneController: phoneController,
              zipController: zipController,
              selectedDeliveryIndex: selectedDeliveryIndex,
              onSelectDelivery: (value) {
                setState(() {
                  selectedDeliveryIndex = value;
                });
              },
            ),
          ),
          MainButton(
            onPressed: () {
              if (currentPage == 0) {
                if (formkey.currentState!.validate()) {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                } else {
                  valueNotifier.value = AutovalidateMode.always;
                }
              } else if (currentPage == 1) {
                if (selectedDeliveryIndex != null) {
                  pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                } else {
                  customSnackBar(
                    context,
                    'Please select a delivery method',
                    AppColors.errorRed,
                  );
                }
              } else if (currentPage == 2) {

                final items = context.read<CartCubit>().productsList.map(
                  (item) => OrderItemModel(
                    productId: item.id,
                    productName: item.name,
                    quantity: item.quantity,
                    price: item.price.toDouble(),
                    orderId: null
                  )
                ).toList();

                final order = OrderModel(
                  uId: sl.get<SupabaseClient>().auth.currentUser!.id,
                  fullName: nameController.text,
                  phone: phoneController.text,
                  address: addressController.text,
                  city: cityController.text,
                  totalPrice: context.read<CartCubit>().getTotalPrice() + 10,
                  status: 'pending',
                  createdAt: DateTime.now(),
                  items: items,
                );
                context.read<CheckoutCubit>().uploadOrder(order, items);
               
              }
            },
            text: getStepTitle(currentPage),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  String getStepTitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'CONTINUE TO PAYMENT';
      case 1:
        return 'CONTINUE TO SUMMARY';
      case 2:
        return 'CONFIRM';
      default:
        return 'Not Found Title';
    }
  }
}

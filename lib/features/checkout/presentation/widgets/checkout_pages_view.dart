import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/confirmation_step.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/delivery_selection_step.dart';
import 'package:lapo_app/features/checkout/presentation/widgets/shipping_info_step.dart';

class CheckoutPagesView extends StatelessWidget {
  const CheckoutPagesView({
    super.key,
    required this.formkey,
    required this.valueListenable,
    required this.nameController,
    required this.addressController,
    required this.cityController,
    required this.zipController,
    required this.phoneController,
    required this.pageController,
    required this.selectedDeliveryIndex,
    required this.onSelectDelivery,
    required this.onPageChanged,
  });
  final PageController pageController;
  final GlobalKey<FormState> formkey;
  final ValueListenable<AutovalidateMode> valueListenable;
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController zipController;
  final TextEditingController phoneController;
  final int? selectedDeliveryIndex;
  final Function(int) onSelectDelivery;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: onPageChanged,
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ShippingInfoStep(
          valueListenable: valueListenable,
          formkey: formkey,
          addressController: addressController,
          cityController: cityController,
          nameController: nameController,
          phoneController: phoneController,
          zipController: zipController,
        ),
        DeliverySelectionStep(
          selectedDeliveryIndex: selectedDeliveryIndex,
          onSelectDelivery: onSelectDelivery,
        ),
        ConfirmationStep(
          nameController: nameController,
          addressController: addressController,
          cityController: cityController,
          phoneController: phoneController,
          zipController: zipController,
        ),
      ],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/auth/presentation/widgets/custom_text_form_field.dart';

class ShippingInfoStep extends StatelessWidget {
  const ShippingInfoStep({
    super.key,
    required this.formkey,
    required this.valueListenable,
    required this.nameController,
    required this.addressController,
    required this.cityController,
    required this.zipController,
    required this.phoneController,
  });
  final GlobalKey<FormState> formkey;
  final ValueListenable<AutovalidateMode> valueListenable;
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController zipController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, child) => Form(
        key: formkey,
        autovalidateMode: value,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Text(
                'Shipping Details',
                style: TextTheme.of(context).bodyLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your destination for midnight tech delivery',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              CustomTextFormField(
                hintText: 'Full Name',
                controller: nameController,
                title: 'Recipient Name',
                obscureText: false,
                suffixIcon: Icon(Icons.person),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Baghdad Street',
                controller: addressController,
                title: 'Street Address',
                obscureText: false,
                suffixIcon: Icon(Icons.home_filled),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'Damascus',
                      controller: cityController,
                      obscureText: false,
                      title: 'City',
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: '10001',
                      controller: zipController,
                      obscureText: false,
                      title: 'Zip Code',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: '09 000-000-00',
                suffixIcon: Icon(Icons.phone),
                controller: phoneController,
                obscureText: false,
                title: 'Contact Number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

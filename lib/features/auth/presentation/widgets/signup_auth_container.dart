import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/features/auth/presentation/widgets/custom_checkbox_row.dart';
import 'package:lapo_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:lapo_app/features/auth/presentation/widgets/signup_button_blocconsumer.dart';

class SignupAuthContainer extends StatefulWidget {
  const SignupAuthContainer({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey, required this.onValidationError,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
    final VoidCallback onValidationError;
  @override
  State<SignupAuthContainer> createState() => _SignupAuthContainerState();
}

class _SignupAuthContainerState extends State<SignupAuthContainer> {
  bool isObscure = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.accentCyan.withAlpha(15),
      ),
      child: Column(
        children: [
          CustomTextFormField(
            title: 'Full Name',
            hintText: 'amaar abd alrahman',
            obscureText: false,
            controller: widget.nameController,
            suffixIcon: Icon(
              Icons.person,
              color: AppColors.textSecondary.withAlpha(100),
            ),
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            title: 'Email Address',
            hintText: 'abdamaar64@gmail.com',
            obscureText: false,
            controller: widget.emailController,
            suffixIcon: Icon(
              Icons.email,
              color: AppColors.textSecondary.withAlpha(100),
            ),
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            title: 'Password',
            hintText: '********',
            controller: widget.passwordController,
            obscureText: isObscure,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: FaIcon(
                isObscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                color: AppColors.textSecondary.withAlpha(100),
                size: 20,
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          CustomCheckboxRow(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          SizedBox(height: height * 0.03),
          SignupButtonBlocconsumer(
            formKey: widget.formKey,
            nameController: widget.nameController,
            emailController: widget.emailController,
            passwordController: widget.passwordController,
            isChecked: isChecked,
            onValidationError: widget.onValidationError,
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}

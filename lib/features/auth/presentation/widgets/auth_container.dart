import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapo_app/core/theme/app_colors.dart';
import 'package:lapo_app/core/presentation/widgets/mian_button.dart';
import 'package:lapo_app/features/auth/presentation/widgets/accounts_buttons_row.dart';
import 'package:lapo_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:lapo_app/features/auth/presentation/widgets/or_divider.dart';
import 'package:lapo_app/features/auth/presentation/widgets/user_question_row.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({
    super.key,
    required this.emailcontroller,
    required this.passwordcontroller,
  });
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  bool isObscure = true;
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
          Text('Welcome Back', style: TextTheme.of(context).displaySmall),
          const SizedBox(height: 8),
          Text(
            'Experience elite computing',
            style: TextTheme.of(
              context,
            ).bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          SizedBox(height: height * 0.04),
          CustomTextFormField(
            title: 'Email Address',
            hintText: 'abdamaar64@gmail.com',
            obscureText: false,
            controller: widget.emailcontroller,
            suffixIcon: Icon(
              Icons.email,
              color: AppColors.textSecondary.withAlpha(100),
            ),
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            title: 'Password',
            hintText: '********',
            controller: widget.passwordcontroller,
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

          SizedBox(height: height * 0.01),
          UserQuestionRow(ask: 'Forgate Password ?'),
          SizedBox(height: height * 0.03),
          MainButton(onPressed: () {}, text: 'LOGIN'),
          SizedBox(height: height * 0.03),
          Ordivider(),
          SizedBox(height: height * 0.02),
          AccountsButtonsRow(),
        ],
      ),
    );
  }
}

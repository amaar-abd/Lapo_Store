import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lapo_app/core/utils/app_images.dart';
import 'package:lapo_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class AccountsButtonsRow extends StatelessWidget {
  const AccountsButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            context.read<AuthCubit>().googleSignIn();
          },
          child: SvgPicture.asset(Assets.assetsImagesButtonGoogle),
        ),
        InkWell(
          onTap: () {
            context.read<AuthCubit>().signInWithGitHub();
          },
          child: SvgPicture.asset(Assets.assetsImagesButtonGitHub),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lapo_app/core/utils/app_iamges.dart';

class AccountsButtonsRow extends StatelessWidget {
  const AccountsButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(Assets.assetsImagesButtonGoogle),
        SvgPicture.asset(Assets.assetsImagesButtonApple),
      ],
    );
  }
}

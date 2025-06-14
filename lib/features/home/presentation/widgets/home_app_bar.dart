import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/assets.dart';
import 'gender_drop_down.dart';

Widget homeAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(Assets.imagesProfile),
      ),
      GenderDropdown(),
      CircleAvatar(
        backgroundColor: AppColors.primary,
        child: SvgPicture.asset(Assets.vectorsBag),
      ),
    ],
  );
}

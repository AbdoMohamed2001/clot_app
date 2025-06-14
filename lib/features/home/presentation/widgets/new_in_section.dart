import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

Widget newInSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'New In',
        style: TextStyles.bold16.copyWith(color: AppColors.primary),
      ),
      Text(
        'See All',
        style: TextStyles.book16,
      ),
    ],
  );
}

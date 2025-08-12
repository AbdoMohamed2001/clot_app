import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

Widget newInSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'New In',
        style: TextStyles.bold16.copyWith(color: AppColors.primary),
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/newIn');
        },
        child: Text(
          'See All',
          style: TextStyles.book16,
        ),
      ),
    ],
  );
}

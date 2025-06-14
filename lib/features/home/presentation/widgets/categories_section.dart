import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

Widget categoriesSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Categories',
        style: TextStyles.bold16,
      ),
      Text(
        'See All',
        style: TextStyles.book16,
      ),
    ],
  );
}

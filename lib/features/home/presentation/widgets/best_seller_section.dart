import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

Widget bestSellerSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Top Selling',
        style: TextStyles.bold16,
      ),
      Text(
        'See All',
        style: TextStyles.book16,
      ),
    ],
  );
}

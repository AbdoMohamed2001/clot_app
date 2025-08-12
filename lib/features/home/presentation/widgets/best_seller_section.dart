import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

Widget bestSellerSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Top Selling',
        style: TextStyles.bold16,
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/topSelling');
        },
        child: Text(
          'See All',
          style: TextStyles.book16,
        ),
      ),
    ],
  );
}

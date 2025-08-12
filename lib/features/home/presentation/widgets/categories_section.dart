import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

Widget categoriesSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Categories',
        style: TextStyles.bold16,
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/categories');
        },
        child: Text(
          'See All',
          style: TextStyles.book16,
        ),
      ),
    ],
  );
}

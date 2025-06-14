import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';

Widget categoriesListItem() {
  return Column(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(Assets.imagesProfile),
        radius: 28,
      ),
      SizedBox(height: 5),
      Text(
        'Shorts',
        style: TextStyles.book12,
      )
    ],
  );
}

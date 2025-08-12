import 'package:clot_app/features/categories/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

Widget categoriesListItem(CategoryEntity category) {
  return Column(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(category.imageUrl),
        radius: 28,
      ),
      SizedBox(height: 5),
      Text(
        category.name,
        style: TextStyles.book12,
      )
    ],
  );
}

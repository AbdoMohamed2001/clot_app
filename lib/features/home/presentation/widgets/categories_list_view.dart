import 'package:clot_app/features/categories/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

import 'categories_list_item.dart';

Widget categoriesListView(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 24),
    height: 80,
    child: ListView.separated(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          categoriesListItem(getDummyCategories()[index]),
      separatorBuilder: (context, index) => SizedBox(width: 13.25),
      itemCount: getDummyCategories().length,
    ),
  );
}

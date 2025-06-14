import 'package:flutter/material.dart';

import 'categories_list_item.dart';

Widget categoriesListView(BuildContext context) {
  return SizedBox(
    height: 80,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => categoriesListItem(),
      separatorBuilder: (context, index) => SizedBox(
        width: 13.25,
      ),
      itemCount: 5,
    ),
  );
}

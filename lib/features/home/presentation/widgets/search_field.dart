import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';

Widget searchField() {
  return TextField(
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(0),
      prefixIcon: SvgPicture.asset(
        Assets.vectorsSearch,
      ),
      prefixIconConstraints: BoxConstraints(maxHeight: 13),
      hintText: 'Search',
      hintStyle: TextStyles.bold12,
    ),
  );
}

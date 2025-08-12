import 'package:clot_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.height, this.width});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondBackground,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //IMAGE
          Image.asset(
            Assets.imagesProduct,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
          ),
          //TEXT
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Men's Harrington Jacket",
              style: TextStyles.book12.copyWith(height: 160 / 100),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "\$148.00",
              style: TextStyles.bold12,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

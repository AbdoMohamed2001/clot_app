import 'package:clot_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 281,
      width: 159,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            child: Image.asset(
              Assets.imagesProduct,
              height: 220,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Men's Harrington Jacket",
                    style: TextStyles.book12,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\$148.00",
                    style: TextStyles.bold12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot_app/core/theme/app_colors.dart';
import 'package:clot_app/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, this.height, this.width, required this.productEntity});
  final double? height;
  final double? width;
  final ProductEntity productEntity;
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
          CachedNetworkImage(
            imageUrl: productEntity.images[0],
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          //TEXT
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              productEntity.name['en'],
              style: TextStyles.book12.copyWith(height: 160 / 100),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "${productEntity.price} RM",
              style: TextStyles.bold12,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

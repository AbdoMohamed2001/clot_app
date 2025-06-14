import 'package:clot_app/core/utils/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 281,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => ProductItem(),
        separatorBuilder: (_, i) => SizedBox(width: 12),
      ),
    );
  }
}

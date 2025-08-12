import 'package:clot_app/core/theme/app_colors.dart';
import 'package:clot_app/core/utils/text_styles.dart';
import 'package:clot_app/features/categories/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Shop by Categories', style: TextStyles.bold24),
          const SizedBox(height: 14),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, i) =>
                  CategoriesListTile(categoryEntity: getDummyCategories()[i]),
              separatorBuilder: (_, i) => SizedBox(height: 8),
              itemCount: getDummyCategories().length,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesListTile extends StatelessWidget {
  const CategoriesListTile({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      tileColor: AppColors.secondBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(categoryEntity.imageUrl),
      ),
      title: Text(
        categoryEntity.name,
        style: TextStyles.book16,
      ),
    );
  }
}

import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:clot_app/features/home/presentation/widgets/categories_view/categories_view_body.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: const CategoriesViewBody(),
    );
  }
}

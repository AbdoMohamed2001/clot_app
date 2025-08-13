import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_search_bar.dart';
import '../../../../core/utils/widgets/products_list_view.dart';
import 'best_seller_section.dart';
import 'categories_list_view.dart';
import 'categories_section.dart';
import 'home_app_bar.dart';
import 'new_in_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                //APPBAR
                homeAppBar(),
                const SizedBox(height: 24),
                //SEARCH BAR
                const CustomSearchBar(),
                const SizedBox(height: 24),
                //CATEGORIES
                categoriesSection(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
          //CATEGORIES LIST VIEW
          const CategoriesListView(),
          // categoriesListView(context),
          const SizedBox(height: 24),
          //BEST SELLER SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: bestSellerSection(context),
          ),
          const SizedBox(height: 16),
          //BEST SELLER LIST VIEW
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: const ProductsListView(),
          ),
          //NEW IN SECTION
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: newInSection(context),
          ),
          const SizedBox(height: 16),
          //NEW IN LIST VIEW
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: const ProductsListView(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

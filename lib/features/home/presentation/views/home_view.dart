import 'package:clot_app/core/utils/widgets/custom_search_bar.dart';
import 'package:clot_app/core/utils/widgets/products_list_view.dart';
import 'package:flutter/material.dart';

import '../widgets/best_seller_section.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/categories_section.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/new_in_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  homeAppBar(),
                  SizedBox(height: 24),
                  CustomSearchBar(),
                  SizedBox(height: 24),
                  categoriesSection(),
                  SizedBox(height: 16),
                  categoriesListView(context),
                  SizedBox(height: 24),
                  bestSellerSection(),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: ProductsListView(),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: newInSection(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: ProductsListView(),
            ),
          ],
        ),
      ),
    );
  }
}

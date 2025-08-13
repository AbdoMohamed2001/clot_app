import 'package:clot_app/core/services/get_it_services_locator.dart';
import 'package:clot_app/features/categories/domain/entities/category_entity.dart';
import 'package:clot_app/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:clot_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'categories_list_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(getIt<GetAllCategoriesUseCase>()),
      child: Container(
        padding: EdgeInsets.only(left: 24),
        height: 80,
        child: CategoriesListViewBuilder(),
      ),
    );
  }
}

class CategoriesListViewBuilder extends StatefulWidget {
  const CategoriesListViewBuilder({super.key});

  @override
  State<CategoriesListViewBuilder> createState() =>
      _CategoriesListViewBuilderState();
}

class _CategoriesListViewBuilderState extends State<CategoriesListViewBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => categoriesListItem(
              state.categories[index],
            ),
            separatorBuilder: (context, index) => SizedBox(width: 13.25),
            itemCount: state.categories.length,
          );
        } else if (state is CategoryFailure) {
          return Center(
            child: Text(state.message),
          );
        }

        return Skeletonizer(
          enabled: state is CategoryLoading,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                categoriesListItem(getDummyCategories()[index]),
            separatorBuilder: (context, index) => SizedBox(width: 13.25),
            itemCount: getDummyCategories().length,
          ),
        );
      },
    );
  }
}

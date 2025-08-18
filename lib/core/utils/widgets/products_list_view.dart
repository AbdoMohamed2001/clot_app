import 'dart:developer';

import 'package:clot_app/core/services/get_it_services_locator.dart';
import 'package:clot_app/core/utils/widgets/product_item.dart';
import 'package:clot_app/features/products/domain/usecases/product_usecase.dart';
import 'package:clot_app/features/products/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
    this.isNewIn = false,
    this.isBestSelling = false,
  });

  final bool isNewIn;
  final bool isBestSelling;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt<ProductUseCase>()),
      child: SizedBox(
        height: 288,
        child: ProductsListViewBuilder(
          isBestSelling: isBestSelling,
          isNewIn: isNewIn,
        ),
      ),
    );
  }
}

class ProductsListViewBuilder extends StatefulWidget {
  const ProductsListViewBuilder({
    super.key,
    this.isNewIn = false,
    this.isBestSelling = false,
  });

  final bool isNewIn;
  final bool isBestSelling;

  @override
  State<ProductsListViewBuilder> createState() =>
      _ProductsListViewBuilderState();
}

class _ProductsListViewBuilderState extends State<ProductsListViewBuilder> {
  @override
  void initState() {
    log('this is is best value ${widget.isBestSelling}');
    super.initState();
    if (widget.isNewIn) {
      context.read<ProductCubit>().getNewProducts();
    } else if (widget.isBestSelling) {
      context.read<ProductCubit>().getBestSalesProducts();
    } else {
      context.read<ProductCubit>().getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductGetSuccess) {
          return ListView.separated(
            itemCount: state.products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) =>
                ProductItem(productEntity: state.products[i]),
            separatorBuilder: (_, i) => SizedBox(width: 12),
          );
        }
        if (state is ProductGetFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          log(state.toString());
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

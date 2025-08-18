part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductGetLoading extends ProductState {}

final class ProductGetSuccess extends ProductState {
  final List<ProductEntity> products;

  ProductGetSuccess(this.products);
}

final class ProductGetFailure extends ProductState {
  final String message;

  ProductGetFailure(this.message);
}

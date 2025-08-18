import 'dart:developer';

import 'package:clot_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/product_model.dart';
import '../../data/repos/product_repo.dart';
import '../entities/product_entity.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepoImpl(this.productRemoteDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      List<ProductModel> models = await productRemoteDataSource.getProducts();
      List<ProductEntity> products =
          models.map((model) => model.toEntity()).toList();
      return right(products);
    } catch (e) {
      log('error while trying to get products $e');
      return left(ServerFailure(message: 'error while trying to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSalesProducts() async {
    try {
      List<ProductModel> models =
          await productRemoteDataSource.getBestSalesProducts();
      List<ProductEntity> products =
          models.map((model) => model.toEntity()).toList();
      return right(products);
    } catch (e) {
      log('error while trying to get products $e');
      return left(ServerFailure(message: 'error while trying to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getInSaleProducts() async {
    try {
      List<ProductModel> models =
          await productRemoteDataSource.getInSaleProducts();
      List<ProductEntity> products =
          models.map((model) => model.toEntity()).toList();
      return right(products);
    } catch (e) {
      log('error while trying to get products $e');
      return left(ServerFailure(message: 'error while trying to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getLatestProducts() async {
    try {
      List<ProductModel> models =
          await productRemoteDataSource.getInSaleProducts();
      List<ProductEntity> products =
          models.map((model) => model.toEntity()).toList();
      return right(products);
    } catch (e) {
      log('error while trying to get products $e');
      return left(ServerFailure(message: 'error while trying to get products'));
    }
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getInSaleProducts();

  Future<Either<Failure, List<ProductEntity>>> getBestSalesProducts();

  Future<Either<Failure, List<ProductEntity>>> getLatestProducts();
}

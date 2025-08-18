import 'package:clot_app/core/errors/failure.dart';
import 'package:clot_app/features/products/data/repos/product_repo.dart';
import 'package:clot_app/features/products/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductUseCase {
  Future<Either<Failure, List<ProductEntity>>> getProductsUseCase();
  Future<Either<Failure, List<ProductEntity>>> getBestSalesProductsUseCase();
  Future<Either<Failure, List<ProductEntity>>> getInSaleProductsUseCase();
  Future<Either<Failure, List<ProductEntity>>> getLatestProductsUseCase();
}

class ProductUseCaseImpl extends ProductUseCase {
  final ProductRepo productRepo;

  ProductUseCaseImpl(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsUseCase() async {
    return productRepo.getProducts();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
      getBestSalesProductsUseCase() async {
    return await productRepo.getBestSalesProducts();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
      getInSaleProductsUseCase() async {
    return await productRepo.getInSaleProducts();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
      getLatestProductsUseCase() async {
    return await productRepo.getLatestProducts();
  }
}

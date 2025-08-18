import 'package:bloc/bloc.dart';
import 'package:clot_app/features/products/domain/entities/product_entity.dart';
import 'package:clot_app/features/products/domain/usecases/product_usecase.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productUseCase) : super(ProductInitial());
  final ProductUseCase productUseCase;

  void getProducts() async {
    emit(ProductGetLoading());
    var result = await productUseCase.getProductsUseCase();
    result.fold(
      (fail) {
        emit(ProductGetFailure(fail.message));
      },
      (products) {
        emit(ProductGetSuccess(products));
      },
    );
  }

  void getNewProducts() async {
    emit(ProductGetLoading());
    var result = await productUseCase.getLatestProductsUseCase();
    result.fold(
      (fail) {
        emit(ProductGetFailure(fail.message));
      },
      (products) {
        emit(ProductGetSuccess(products));
      },
    );
  }

  void getBestSalesProducts() async {
    emit(ProductGetLoading());
    var result = await productUseCase.getBestSalesProductsUseCase();
    result.fold(
      (fail) {
        emit(ProductGetFailure(fail.message));
      },
      (products) {
        emit(ProductGetSuccess(products));
      },
    );
  }
}

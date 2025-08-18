import 'package:clot_app/core/services/database_services.dart';
import 'package:clot_app/core/utils/back_end_points.dart';
import 'package:clot_app/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();

  Future<List<ProductModel>> getInSaleProducts();

  Future<List<ProductModel>> getBestSalesProducts();

  Future<List<ProductModel>> getLatestProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DatabaseServices databaseServices;

  ProductRemoteDataSourceImpl(this.databaseServices);

  @override
  Future<List<ProductModel>> getProducts() async {
    List<Map<String, dynamic>> data = await databaseServices.getData(
      path: BackEndEndPoints.productsCollection,
    );
    List<ProductModel> products =
        data.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }

  @override
  Future<List<ProductModel>> getBestSalesProducts() async {
    List<Map<String, dynamic>> data = await databaseServices.getData(
      path: BackEndEndPoints.productsCollection,
      query: {
        "orderBy": "salesCount",
      },
    );
    List<ProductModel> products =
        data.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }

  @override
  Future<List<ProductModel>> getInSaleProducts() async {
    List<Map<String, dynamic>> data = await databaseServices.getData(
      path: BackEndEndPoints.productsCollection,
      query: {
        "where": "inSale",
      },
      whereFieldValue: true,
    );
    List<ProductModel> products =
        data.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }

  @override
  Future<List<ProductModel>> getLatestProducts() async {
    List<Map<String, dynamic>> data = await databaseServices.getData(
      path: BackEndEndPoints.productsCollection,
      query: {
        "orderBy": "createdAt",
      },
    );
    List<ProductModel> products =
        data.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }
}

import 'package:clot_app/core/services/database_services.dart';
import 'package:clot_app/core/utils/back_end_points.dart';
import 'package:clot_app/features/categories/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final DatabaseServices databaseServices;

  CategoryRemoteDataSourceImpl(this.databaseServices);
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    List<Map<String, dynamic>> data = await databaseServices.getData(
        path: BackEndEndPoints.categoriesCollection);
    List<CategoryModel> categories =
        data.map((e) => CategoryModel.fromJson(e)).toList();
    return categories;
  }
}

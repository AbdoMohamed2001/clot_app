import 'package:clot_app/core/errors/failure.dart';
import 'package:clot_app/features/categories/data/datasources/category_remote_data_source.dart';
import 'package:clot_app/features/categories/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';
import '../../data/repos/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepoImpl(this.categoryRemoteDataSource);
  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final categoriesModels =
          await categoryRemoteDataSource.getAllCategories();
      List<CategoryEntity> categories =
          categoriesModels.map((e) => e.toEntity()).toList();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoryById(String id) {
    throw UnimplementedError();
  }
}

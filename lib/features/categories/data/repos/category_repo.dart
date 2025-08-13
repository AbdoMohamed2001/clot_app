import 'package:clot_app/core/errors/failure.dart';
import 'package:clot_app/features/categories/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepo {
  /// GET ALL CATEGORIES
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();

  /// GET CATEGORY BY ID
  Future<Either<Failure, List<CategoryEntity>>> getCategoryById(String id);
}

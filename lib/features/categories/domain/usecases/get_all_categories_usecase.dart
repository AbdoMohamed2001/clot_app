import 'package:clot_app/core/errors/failure.dart';
import 'package:clot_app/core/utils/usecase.dart';
import 'package:clot_app/features/categories/data/repos/category_repo.dart';
import 'package:clot_app/features/categories/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

class GetAllCategoriesUseCase extends UseCase<List<CategoryEntity>, dynamic> {
  final CategoryRepo categoryRepo;

  GetAllCategoriesUseCase(this.categoryRepo);
  @override
  Future<Either<Failure, List<CategoryEntity>>> call({params}) async {
    return categoryRepo.getAllCategories();
  }
}

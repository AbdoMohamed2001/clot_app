import 'package:bloc/bloc.dart';
import 'package:clot_app/features/categories/domain/entities/category_entity.dart';
import 'package:clot_app/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.getAllCategoriesUseCase) : super(CategoryInitial());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  void getAllCategories() async {
    var result = await getAllCategoriesUseCase.call();
    result.fold(
      (fail) {
        emit(CategoryFailure(fail.message));
      },
      (categories) {
        emit(CategoryLoaded(categories));
      },
    );
  }
}

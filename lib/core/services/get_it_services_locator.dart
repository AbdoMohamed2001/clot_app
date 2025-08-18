import 'package:clot_app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:clot_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:clot_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:clot_app/features/auth/domain/use-cases/is_logged_use_case.dart';
import 'package:clot_app/features/auth/domain/use-cases/login_use_case.dart';
import 'package:clot_app/features/auth/domain/use-cases/register_use_case.dart';
import 'package:clot_app/features/categories/data/datasources/category_remote_data_source.dart';
import 'package:clot_app/features/categories/data/repos/category_repo.dart';
import 'package:clot_app/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:clot_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:clot_app/features/products/data/repos/product_repo.dart';
import 'package:clot_app/features/products/domain/usecases/product_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../features/categories/domain/repos/category_repo_impl.dart';
import '../../features/products/domain/repos/product_repo_impl.dart';
import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_firestore_services.dart';

final getIt = GetIt.instance;

setupGitIt() {
  // ----------------------------------------------------------------------------
  // SERVICES
  // ----------------------------------------------------------------------------
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  // ----------------------------------------------------------------------------
  // DATA SOURCES
  // ----------------------------------------------------------------------------
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(
      getIt<FirebaseAuthService>(), getIt<DatabaseServices>()));
  getIt.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl());
  getIt.registerSingleton<CategoryRemoteDataSource>(
    CategoryRemoteDataSourceImpl(
      getIt<DatabaseServices>(),
    ),
  );
  getIt.registerSingleton<ProductRemoteDataSource>(
    ProductRemoteDataSourceImpl(
      getIt<DatabaseServices>(),
    ),
  );
  // ----------------------------------------------------------------------------
  // REPOS
  // ----------------------------------------------------------------------------
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      getIt<AuthRemoteDataSource>(),
      getIt<AuthLocalDataSource>(),
    ),
  );
  getIt.registerSingleton<CategoryRepo>(
    CategoryRepoImpl(
      getIt<CategoryRemoteDataSource>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      getIt<ProductRemoteDataSource>(),
    ),
  );
  // ----------------------------------------------------------------------------
  // USE CASES
  // ----------------------------------------------------------------------------
  getIt.registerSingleton<RegisterUseCase>(RegisterUseCase(getIt<AuthRepo>()));
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt<AuthRepo>()));
  getIt.registerSingleton<IsLoggedUseCase>(IsLoggedUseCase(getIt<AuthRepo>()));
  getIt.registerSingleton<GetAllCategoriesUseCase>(
      GetAllCategoriesUseCase(getIt<CategoryRepo>()));
  getIt.registerSingleton<ProductUseCase>(
      ProductUseCaseImpl(getIt<ProductRepo>()));
  // ----------------------------------------------------------------------------
}

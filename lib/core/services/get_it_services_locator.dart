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
import 'package:get_it/get_it.dart';

import '../../features/categories/domain/repos/category_repo_impl.dart';
import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_firestore_services.dart';

final getIt = GetIt.instance;

setupGitIt() {
  //Services
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());

//Data Sources
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(
      getIt<FirebaseAuthService>(), getIt<DatabaseServices>()));
  getIt.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl());
  getIt.registerSingleton<CategoryRemoteDataSource>(
    CategoryRemoteDataSourceImpl(
      getIt<DatabaseServices>(),
    ),
  );
  //Repos
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
  //UseCases
  getIt.registerSingleton<RegisterUseCase>(RegisterUseCase(getIt<AuthRepo>()));
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt<AuthRepo>()));
  getIt.registerSingleton<IsLoggedUseCase>(IsLoggedUseCase(getIt<AuthRepo>()));
  getIt.registerSingleton<GetAllCategoriesUseCase>(
    GetAllCategoriesUseCase(
      getIt<CategoryRepo>(),
    ),
  );
}

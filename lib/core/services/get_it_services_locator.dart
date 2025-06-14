import 'package:clot_app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:clot_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:clot_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:clot_app/features/auth/domain/use-cases/login_use_case.dart';
import 'package:clot_app/features/auth/domain/use-cases/register_use_case.dart';
import 'package:get_it/get_it.dart';

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

  //Repos
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      getIt<AuthRemoteDataSource>(),
      getIt<AuthLocalDataSource>(),
    ),
  );

  //UseCases
  getIt.registerSingleton<RegisterUseCase>(RegisterUseCase(getIt<AuthRepo>()));
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt<AuthRepo>()));
}

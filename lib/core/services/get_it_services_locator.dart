import 'package:clot_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:clot_app/features/auth/domain/use-cases/register_use_case.dart';
import 'package:get_it/get_it.dart';

import 'database_services.dart';
import 'firebase_auth_services.dart';
import 'firebase_firestore_services.dart';

final getIt = GetIt.instance;

void setupGitIt() {
  //Services

  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());

  //Repos

  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(getIt<FirebaseAuthService>(), getIt<DatabaseServices>()));

  //UseCases
  getIt.registerSingleton<RegisterUseCase>(RegisterUseCase(getIt<AuthRepo>()));
}

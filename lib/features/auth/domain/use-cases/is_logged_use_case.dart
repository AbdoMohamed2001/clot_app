import 'package:clot_app/core/errors/failure.dart';
import 'package:clot_app/core/utils/usecase.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class IsLoggedUseCase extends UseCase<bool, dynamic> {
  final AuthRepo authRepo;

  IsLoggedUseCase(this.authRepo);
  @override
  Future<Either<Failure, bool>> call({params}) async {
    return authRepo.isLogged();
  }
}

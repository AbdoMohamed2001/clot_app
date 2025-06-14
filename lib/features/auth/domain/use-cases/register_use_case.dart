import 'package:clot_app/core/errors/failure.dart';
import 'package:clot_app/core/utils/usecase.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase extends UseCase<void, UserCreateReqModel> {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);
  @override
  Future<Either<Failure, void>> call({UserCreateReqModel? params}) async {
    return authRepo.register(params!);
  }
}

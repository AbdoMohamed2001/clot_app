import 'package:clot_app/core/errors/failure.dart';
import 'package:clot_app/core/utils/usecase.dart';
import 'package:clot_app/features/auth/data/models/user_login_req_model.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<void, UserLoginReqModel> {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  @override
  Future<Either<Failure, void>> call({UserLoginReqModel? params}) async {
    return authRepo.login(params!.email, params.password!);
  }
}

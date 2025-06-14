import 'package:clot_app/core/errors/failure.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, void>> register(UserCreateReqModel user);
  Either<Failure, bool> isLogged();
}

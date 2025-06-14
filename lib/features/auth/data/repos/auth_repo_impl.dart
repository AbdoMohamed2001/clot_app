import 'dart:developer';

import 'package:clot_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/domain/entities/user_entity.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../datasources/local/auth_local_datasource.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepoImpl(this.authRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final user = await authRemoteDataSource.login(email, password);
      await authLocalDataSource.saveUser(user);
      return right(user.toEntity());
    } on CustomExceptions catch (e) {
      log('error in register user in auth remote impl ${e.toString()}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('error in register user in auth remote impl ${e.toString()}');
      return left(ServerFailure(message: 'There is an error'));
    }
  }

  @override
  Future<Either<Failure, void>> register(UserCreateReqModel user) async {
    final result = await authRemoteDataSource.register(user);
    return result.fold(
      (fail) {
        return left(ServerFailure(message: fail.message));
      },
      (user) async {
        await authLocalDataSource.saveUser(user);
        return right(null);
      },
    );
  }

  @override
  Either<Failure, bool> isLogged() {
    return authRemoteDataSource.isLogged();
  }
}

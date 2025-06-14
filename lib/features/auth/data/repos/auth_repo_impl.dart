import 'package:clot_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../datasources/local/auth_local_datasource.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepoImpl(this.authRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
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

  // Future<Either<Failure, void>> register(UserCreateReqModel user) async {
  //   User? userCredential;
  //   try {
  //     userCredential = await firebaseAuthService.registerUser(
  //         email: user.email, password: user.password);
  //     final userModel = UserModel(
  //       uid: userCredential.uid,
  //       email: user.email,
  //       firstName: user.firstName,
  //       lastName: user.lastName,
  //       gender: user.gender!,
  //       age: user.age!,
  //     );
  //     await fireStoreServices.addData(
  //       path: 'users',
  //       recordId: userCredential.uid,
  //       data: {
  //         'firstName': user.firstName,
  //         'lastName': user.lastName,
  //         'email': user.email,
  //         'gender': user.gender,
  //         'age': user.age,
  //         'id': userCredential.uid,
  //       },
  //     );
  //     return right(null);
  //   } on CustomExceptions catch (e) {
  //     await deleteUserMethod(userCredential);
  //     log('error in register user in auth repo impl ${e.toString()}');
  //     return left(ServerFailure(message: e.message));
  //   } catch (e) {
  //     log('error in register user in auth repo impl ${e.toString()}');
  //     return left(ServerFailure(message: 'There is an error'));
  //   }
  // }
}

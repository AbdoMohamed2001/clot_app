import 'dart:developer';

import 'package:clot_app/core/services/database_services.dart';
import 'package:clot_app/core/services/firebase_auth_services.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices fireStoreServices;

  AuthRepoImpl(this.firebaseAuthService, this.fireStoreServices);

  @override
  Future<Either> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> register(UserCreateReqModel user) async {
    User? userAuth;
    try {
      userAuth = await firebaseAuthService.registerUser(
          email: user.email, password: user.password);
      await fireStoreServices.addData(
        path: 'users',
        recordId: userAuth.uid,
        data: {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email,
          'gender': user.gender,
          'age': user.age,
          'id': userAuth.uid,
        },
      );
      return right(null);
    } on CustomExceptions catch (e) {
      await deleteUserMethod(userAuth);
      log('error in register user in auth repo impl ${e.toString()}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('error in register user in auth repo impl ${e.toString()}');
      return left(ServerFailure(message: 'There is an error'));
    }
  }

  Future<void> deleteUserMethod(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }
}

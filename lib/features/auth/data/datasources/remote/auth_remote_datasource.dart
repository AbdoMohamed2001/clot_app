import 'dart:developer';

import 'package:clot_app/core/services/database_services.dart';
import 'package:clot_app/core/services/firebase_auth_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/user_create_req_model.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserModel>> register(UserCreateReqModel user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices fireStoreServices;

  AuthRemoteDataSourceImpl(this.firebaseAuthService, this.fireStoreServices);

  // Future<UserModel> signIn(String email, String password) async {
  //   final result = await firebaseAuthService.signInWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  //
  //   final user = result.user!;
  //   final snapshot = await firestore.collection('users').doc(user.uid).get();
  //   return UserModel.fromJson(snapshot.data()!..['uid'] = user.uid);
  // }

  @override
  Future<Either<Failure, UserModel>> register(UserCreateReqModel user) async {
    User? userCredential;
    try {
      userCredential = await firebaseAuthService.registerUser(
          email: user.email, password: user.password);
      if (user.gender == null || user.age == null) {
        throw CustomExceptions(message: 'Age or gender missing');
      }
      final userModel = UserModel(
        uid: userCredential.uid,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        gender: user.gender!,
        age: user.age!,
      );
      await fireStoreServices.addData(
        path: 'users',
        recordId: userCredential.uid,
        data: userModel.toJson(),
      );
      return right(userModel);
    } on CustomExceptions catch (e) {
      await deleteUserMethod(userCredential);
      log('error in register user in auth remote impl ${e.toString()}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('error in register user in auth remote impl ${e.toString()}');
      return left(ServerFailure(message: 'There is an error'));
    }
  }

  Future<void> deleteUserMethod(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  // Future<void> signUp(UserModel user, String password) async {
  //   final result = await auth.createUserWithEmailAndPassword(
  //     email: user.email,
  //     password: password,
  //   );
  //
  //   final newUser = result.user!;
  //   await firestore.collection('users').doc(newUser.uid).set(user.toJson());
  // }
  //
  // Future<void> signOut() async {
  //   await firebaseAuthService.signOut();
  // }
}

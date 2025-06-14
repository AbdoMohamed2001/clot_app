import 'package:bloc/bloc.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/data/models/user_login_req_model.dart';
import 'package:clot_app/features/auth/domain/use-cases/login_use_case.dart';
import 'package:clot_app/features/auth/domain/use-cases/register_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.registerUseCase, this.loginUseCase) : super(AuthInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  AutovalidateMode emailAutoValidateMode = AutovalidateMode.disabled;
  AutovalidateMode passAutoValidateMode = AutovalidateMode.disabled;
  bool validateEmail() => emailFormKey.currentState?.validate() ?? false;
  bool validatePassword() => passwordFormKey.currentState?.validate() ?? false;

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  void login({required UserLoginReqModel user}) async {
    emit(AuthLoading());
    var result = await loginUseCase.call(params: user);
    result.fold(
      (fail) {
        emit(AuthFailure(fail.message));
      },
      (success) {
        emit(AuthSuccess());
      },
    );
  }

  void register({required UserCreateReqModel user}) async {
    emit(AuthLoading());
    var result = await registerUseCase.call(params: user);
    result.fold(
      (fail) {
        emit(AuthFailure(fail.message));
      },
      (success) {
        emit(AuthSuccess());
      },
    );
  }
}

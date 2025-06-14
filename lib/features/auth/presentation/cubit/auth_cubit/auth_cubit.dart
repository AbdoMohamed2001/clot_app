import 'package:bloc/bloc.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/domain/use-cases/register_use_case.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.registerUseCase) : super(AuthInitial());

  final RegisterUseCase registerUseCase;

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

import 'package:bloc/bloc.dart';
import 'package:clot_app/features/auth/domain/use-cases/is_logged_use_case.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.isLoggedUseCase) : super(SplashInitial());
  final IsLoggedUseCase isLoggedUseCase;
  void appStarted() async {
    var result = await isLoggedUseCase.call();
    result.fold(
      (ifLeft) {
        emit(SplashError());
      },
      (isLogged) async {
        await Future.delayed(
          Duration(seconds: 2),
        );
        if (isLogged) {
          emit(SplashAuthorized());
        } else {
          emit(SplashUnAuthorized());
        }
      },
    );
  }
}

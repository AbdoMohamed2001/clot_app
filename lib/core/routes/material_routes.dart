import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/presentation/views/login_view.dart';
import 'package:clot_app/features/auth/presentation/views/password_view.dart';
import 'package:clot_app/features/auth/presentation/views/register_view.dart';
import 'package:clot_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:clot_app/features/auth/presentation/views/user_prefs_view.dart';
import 'package:clot_app/features/home/presentation/views/home_view.dart';
import 'package:clot_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/reset_message_view.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashView());
    case '/login':
      return MaterialPageRoute(
        builder: (_) => LoginView(),
      );
    case '/password':
      return MaterialPageRoute(
        builder: (_) => PasswordView(),
      );
    case '/register':
      return MaterialPageRoute(
        builder: (_) => RegisterView(),
      );
    case '/reset':
      return MaterialPageRoute(
        builder: (_) => ResetPasswordView(),
      );
    case '/reset-message':
      return MaterialPageRoute(
        builder: (_) => ResetMessageView(),
      );
    case '/user-prefs':
      final UserCreateReqModel user = settings.arguments as UserCreateReqModel;
      return MaterialPageRoute(
        builder: (_) => UserPrefsView(
          user: user,
        ),
      );

    case '/home':
      return MaterialPageRoute(
        builder: (_) => HomeView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('Page Not Found')),
        ),
      );
  }
}

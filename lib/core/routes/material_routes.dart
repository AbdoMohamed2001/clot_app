import 'package:clot_app/features/auth/presentation/views/login_view.dart';
import 'package:clot_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashView());
    case '/login':
      return MaterialPageRoute(
        builder: (_) => LoginView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('Page Not Found')),
        ),
      );
  }
}

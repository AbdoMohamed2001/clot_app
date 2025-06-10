import 'package:clot_app/core/routes/material_routes.dart';
import 'package:clot_app/core/theme/app_theme.dart';
import 'package:clot_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:clot_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appTheme,
        home: const SplashView(),
        onGenerateRoute: generateRoute,
        initialRoute: '/',
      ),
    );
  }
}

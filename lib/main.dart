import 'package:clot_app/core/routes/material_routes.dart';
import 'package:clot_app/core/services/get_it_services_locator.dart';
import 'package:clot_app/core/theme/app_theme.dart';
import 'package:clot_app/features/auth/domain/use-cases/is_logged_use_case.dart';
import 'package:clot_app/features/auth/domain/use-cases/login_use_case.dart';
import 'package:clot_app/features/auth/domain/use-cases/register_use_case.dart';
import 'package:clot_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:clot_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:clot_app/features/splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/shared_prefs_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setupGitIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SplashCubit(getIt<IsLoggedUseCase>())..appStarted(),
        ),
        BlocProvider(
          create: (context) =>
              AuthCubit(getIt<RegisterUseCase>(), getIt<LoginUseCase>()),
        ),
      ],
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

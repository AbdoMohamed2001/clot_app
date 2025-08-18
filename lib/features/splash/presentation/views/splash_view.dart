import 'package:clot_app/core/theme/app_colors.dart';
import 'package:clot_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:clot_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashUnAuthorized) {
          Navigator.pushReplacementNamed(context, '/login');
        } else if (state is SplashAuthorized) {
          Navigator.pushReplacementNamed(context, '/main');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
            child: SvgPicture.asset(
          Assets.vectorsLogo,
        )),
      ),
    );
  }
}

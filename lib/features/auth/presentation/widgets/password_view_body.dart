import 'package:clot_app/core/build_snack_bar.dart';
import 'package:clot_app/core/utils/widgets/custom_button.dart';
import 'package:clot_app/core/utils/widgets/custom_text_field.dart';
import 'package:clot_app/features/auth/data/models/user_login_req_model.dart';
import 'package:clot_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/text_styles.dart';
import 'row_text.dart';

class PasswordViewBody extends StatelessWidget {
  const PasswordViewBody({super.key, required this.user});
  final UserLoginReqModel user;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showSnackBar(context, 'Logged in Successfully');
          Navigator.pushReplacementNamed(context, '/home');
        }
        if (state is AuthFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is AuthLoading,
          child: Form(
            key: cubit.passwordFormKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Sign in',
                    style: TextStyles.bold32,
                  ),
                  SizedBox(height: 32),
                  CustomTextField(
                    hintText: 'Password',
                    controller: context.read<AuthCubit>().passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    isObscure: true,
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'Continue',
                    onTap: () {
                      if (cubit.validatePassword()) {
                        user.password = cubit.passwordController.text;
                        cubit.login(user: user);
                        // Submit form
                      }
                      cubit.passAutoValidateMode = AutovalidateMode.always;
                    },
                  ),
                  SizedBox(height: 16),
                  RowText(
                    text: 'Forgot Password ? ',
                    tappedText: 'Reset',
                    onTap: () {
                      Navigator.pushNamed(context, '/reset');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

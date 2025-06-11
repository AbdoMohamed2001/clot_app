import 'package:clot_app/core/utils/widgets/custom_button.dart';
import 'package:clot_app/core/utils/widgets/custom_text_field.dart';
import 'package:clot_app/core/utils/widgets/social_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';
import 'row_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            'Sign in',
            style: TextStyles.bold32,
          ),
          SizedBox(height: 32),
          CustomTextField(hintText: 'Email Address'),
          SizedBox(height: 16),
          CustomButton(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, '/password');
            },
          ),
          SizedBox(height: 16),
          RowText(
            text: 'Dont have an Account ?',
            tappedText: ' Create One',
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          SizedBox(height: 71),
          SocialButton(
            text: 'Continue With Apple',
            logo: Assets.vectorsApple,
          ),
          SizedBox(height: 12),
          SocialButton(
            text: 'Continue With Google',
            logo: Assets.vectorsGoogle,
          ),
          SizedBox(height: 12),
          SocialButton(
            text: 'Continue With Facebook',
            logo: Assets.vectorsFacebook,
          ),
        ],
      ),
    );
  }
}

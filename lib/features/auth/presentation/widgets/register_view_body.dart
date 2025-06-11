import 'package:clot_app/core/utils/widgets/custom_button.dart';
import 'package:clot_app/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/text_styles.dart';
import 'row_text.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            'Create Account',
            style: TextStyles.bold32,
          ),
          SizedBox(height: 32),
          CustomTextField(hintText: 'Firstname'),
          SizedBox(height: 16),
          CustomTextField(hintText: 'Lastname'),
          SizedBox(height: 16),
          CustomTextField(hintText: 'Email Address'),
          SizedBox(height: 16),
          CustomTextField(hintText: 'Password'),
          SizedBox(height: 40),
          CustomButton(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, '/user-prefs');
            },
          ),
          SizedBox(height: 40),
          RowText(
            text: 'Forgot Password ? ',
            tappedText: 'Reset',
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
        ],
      ),
    );
  }
}

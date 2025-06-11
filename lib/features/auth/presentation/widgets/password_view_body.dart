import 'package:clot_app/core/utils/widgets/custom_button.dart';
import 'package:clot_app/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/text_styles.dart';
import 'row_text.dart';

class PasswordViewBody extends StatelessWidget {
  const PasswordViewBody({super.key});

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
          CustomTextField(hintText: 'Password'),
          SizedBox(height: 16),
          CustomButton(
            text: 'Continue',
            onTap: () {},
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
    );
  }
}

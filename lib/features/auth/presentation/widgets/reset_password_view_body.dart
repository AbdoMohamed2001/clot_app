import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            'Forgot Password',
            style: TextStyles.bold32,
          ),
          SizedBox(height: 32),
          CustomTextField(hintText: 'Enter Email address'),
          SizedBox(height: 16),
          CustomButton(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, '/reset-message');
            },
          ),
        ],
      ),
    );
  }
}

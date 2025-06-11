import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';

class ResetMessageViewBody extends StatelessWidget {
  const ResetMessageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.vectorsEmailSending),
        SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: Text(
            textAlign: TextAlign.center,
            'We Sent you an Email to reset\nyour password.',
            style: TextStyles.medium24,
          ),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text(
            'Return to Login',
            style: TextStyles.book16.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

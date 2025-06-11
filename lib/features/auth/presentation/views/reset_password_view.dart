import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:clot_app/features/auth/presentation/widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: ResetPasswordViewBody(),
    );
  }
}

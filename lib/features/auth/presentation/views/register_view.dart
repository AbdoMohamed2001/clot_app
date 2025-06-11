import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:clot_app/features/auth/presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: RegisterViewBody(),
    );
  }
}

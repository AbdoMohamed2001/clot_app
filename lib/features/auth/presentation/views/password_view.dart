import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/password_view_body.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: PasswordViewBody(),
    );
  }
}

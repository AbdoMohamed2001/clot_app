import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:clot_app/features/auth/data/models/user_login_req_model.dart';
import 'package:flutter/material.dart';

import '../widgets/password_view_body.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key, required this.user});
  final UserLoginReqModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: PasswordViewBody(user: user),
    );
  }
}

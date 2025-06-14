import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:clot_app/features/auth/data/models/user_create_req_model.dart';
import 'package:clot_app/features/auth/presentation/widgets/user_prefs_view_body.dart';
import 'package:flutter/material.dart';

class UserPrefsView extends StatelessWidget {
  const UserPrefsView({super.key, required this.user});
  final UserCreateReqModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: UserPrefsViewBody(user: user),
    );
  }
}

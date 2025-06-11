import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:clot_app/features/auth/presentation/widgets/reset_message_view_body.dart';
import 'package:flutter/material.dart';

class ResetMessageView extends StatelessWidget {
  const ResetMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: ResetMessageViewBody(),
    );
  }
}

import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:clot_app/features/home/presentation/widgets/new_in_view/new_in_view_body.dart';
import 'package:flutter/material.dart';

class NewInView extends StatelessWidget {
  const NewInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: NewInViewBody(),
    );
  }
}

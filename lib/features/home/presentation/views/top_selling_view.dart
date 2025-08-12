import 'package:clot_app/core/utils/widgets/custom_app_bar.dart';
import 'package:clot_app/core/utils/widgets/custom_grid_view/custom_grid_view.dart';
import 'package:clot_app/features/home/presentation/widgets/top_selling_view/top_selling_view_body.dart';
import 'package:flutter/material.dart';

class TopSellingView extends StatelessWidget {
  const TopSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: TopSellingViewBody(),
    );
  }
}

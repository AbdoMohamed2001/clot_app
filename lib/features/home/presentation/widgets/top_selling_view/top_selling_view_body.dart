import 'package:clot_app/core/utils/widgets/custom_grid_view/custom_grid_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/text_styles.dart';

class TopSellingViewBody extends StatelessWidget {
  const TopSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Top Selling (10)',
            style: TextStyles.bold16,
          ),
        ),
        const SizedBox(height: 23),
        Expanded(
          child: CustomGridView(),
        ),
      ],
    );
  }
}

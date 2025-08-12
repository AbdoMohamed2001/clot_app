import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/custom_grid_view/custom_grid_view.dart';

class NewInViewBody extends StatelessWidget {
  const NewInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'New In (15)',
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

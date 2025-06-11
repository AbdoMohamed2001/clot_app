import 'package:clot_app/core/theme/app_colors.dart';
import 'package:clot_app/core/utils/widgets/range_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/small_button.dart';

class UserPrefsViewBody extends StatelessWidget {
  const UserPrefsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: [
          Text(
            'Tell us About yourself',
            style: TextStyles.bold24,
          ),
          SizedBox(height: 49),
          Text(
            'Who do you shop for ?',
            style: TextStyles.book16,
          ),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallButton(text: 'Men'),
              SmallButton(text: 'Women', color: AppColors.secondBackground),
            ],
          ),
          SizedBox(height: 56),
          AgeRangeDropdown(),
        ],
      ),
    );
  }
}

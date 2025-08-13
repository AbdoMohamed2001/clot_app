import 'package:clot_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';

class GenderDropdown extends StatefulWidget {
  final void Function(String)? onChanged;

  const GenderDropdown({super.key, this.onChanged});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String selectedValue = 'Men';
  final List<String> genders = ['Men', 'Women'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          dropdownColor: const Color(0xFF2C2731), // Match dropdown background
          icon: SvgPicture.asset(Assets.vectorsArrowdown2),
          style: TextStyles.bold12,
          padding: EdgeInsets.only(right: 14, left: 10),
          alignment: Alignment.bottomCenter,
          iconSize: 16,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
            if (widget.onChanged != null) widget.onChanged!(value!);
          },
          items: genders.map((gender) {
            return DropdownMenuItem(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

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
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // Semi-transparent dark
        borderRadius: BorderRadius.circular(100), // Pill shape
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          dropdownColor: const Color(0xFF2C2731), // Match dropdown background
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: Colors.white),
          style: TextStyles.bold12,
          padding: EdgeInsets.symmetric(horizontal: 4),
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

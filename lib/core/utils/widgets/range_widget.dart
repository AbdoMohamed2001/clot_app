import 'package:flutter/material.dart';

import '../text_styles.dart';

class AgeRangeDropdown extends StatefulWidget {
  const AgeRangeDropdown({super.key});

  @override
  _AgeRangeDropdownState createState() => _AgeRangeDropdownState();
}

class _AgeRangeDropdownState extends State<AgeRangeDropdown> {
  String? selectedRange;
  final List<String> ageRanges = [
    'Under 18',
    '18-24',
    '25-34',
    '35-44',
    '45-54',
    '55+',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How Old are you ?',
          style: TextStyles.book16,
        ),
        SizedBox(height: 13),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // Dark translucent background
            borderRadius: BorderRadius.circular(50), // Fully rounded
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedRange,
              hint: Text(
                'Age Range',
                style: TextStyle(color: Colors.white70),
              ),
              icon: Icon(Icons.expand_more, color: Colors.white70),
              dropdownColor: Colors.grey[900], // Dark dropdown background
              isExpanded: true,
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  selectedRange = value;
                });
              },
              items: ageRanges.map((range) {
                return DropdownMenuItem(
                  value: range,
                  child: Text(range),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    this.onTap,
    required this.text,
    required this.tappedText,
  });
  final void Function()? onTap;
  final String text, tappedText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyles.book12,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            tappedText,
            style: TextStyles.bold12,
          ),
        ),
      ],
    );
  }
}

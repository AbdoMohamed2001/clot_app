import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../text_styles.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({super.key, this.onTap, this.color, required this.text});
  final void Function()? onTap;
  final Color? color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 52,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: Text(text, style: TextStyles.book16)),
      ),
    );
  }
}

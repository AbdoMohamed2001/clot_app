import 'package:clot_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.width, required this.text, this.onTap});
  final double? width;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11),
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.medium16,
          ),
        ),
      ),
    );
  }
}

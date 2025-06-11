import 'package:clot_app/core/theme/app_colors.dart';
import 'package:clot_app/core/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key, this.onTap, required this.logo, required this.text});

  final void Function()? onTap;
  final String logo, text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.secondBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(logo),
            Text(
              text,
              style: TextStyles.medium16,
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}

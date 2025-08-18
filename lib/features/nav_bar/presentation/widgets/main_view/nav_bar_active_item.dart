import 'package:clot_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarActiveItem extends StatelessWidget {
  const NavBarActiveItem({super.key, required this.image, required this.text});

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      alignment: Alignment.center,
      image,
      colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.dstIn),
      fit: BoxFit.fitHeight,
    );
  }
}

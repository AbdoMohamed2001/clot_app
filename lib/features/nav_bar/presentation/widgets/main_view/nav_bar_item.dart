import 'package:flutter/material.dart';
import '../../../domain/entities/bottom_nav_bar_entity.dart';
import 'nav_bar_active_item.dart';
import 'nav_bar_inactive.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem(
      {super.key, required this.isSelected, required this.bottomNavBarEntity});

  final bool isSelected;
  final BottomNavBarEntity bottomNavBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? NavBarActiveItem(
            image: bottomNavBarEntity.activeIcon,
            text: bottomNavBarEntity.title,
          )
        : NavBarInActive(image: bottomNavBarEntity.inActiveIcon);
  }
}

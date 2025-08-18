import 'package:flutter/material.dart';

import '../../../domain/entities/bottom_nav_bar_entity.dart';
import 'nav_bar_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.onTapped});
  final Function(int) onTapped;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavBarList.map((e) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.onTapped(e.index);
                selectedIndex = e.index;
              });
            },
            child: NavBarItem(
              isSelected: selectedIndex == e.index ? true : false,
              bottomNavBarEntity: e,
            ),
          );
        }).toList(),
      ),
    );
  }
}

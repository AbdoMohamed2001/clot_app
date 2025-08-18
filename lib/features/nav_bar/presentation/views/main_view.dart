import 'package:flutter/material.dart';
import '../widgets/main_view/custom_bottom_nav_bar.dart';
import '../widgets/main_view/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        onTapped: (value) {
          setState(() {
            currentViewIndex = value;
          });
        },
      ),
      body: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}

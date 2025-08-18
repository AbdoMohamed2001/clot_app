import 'package:flutter/material.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../views/notifications_view.dart';
import '../../views/orders_view.dart';
import '../../views/profile_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: [
        const HomeView(),
        const NotificationsView(),
        const OrdersView(),
        const ProfileView(),
      ],
    );
  }
}

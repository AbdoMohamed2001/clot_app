import '../../../../generated/assets.dart';

class BottomNavBarEntity {
  final int index;
  final String title;
  final String activeIcon;
  final String inActiveIcon;

  BottomNavBarEntity({
    required this.index,
    required this.title,
    required this.activeIcon,
    required this.inActiveIcon,
  });
}

List<BottomNavBarEntity> get bottomNavBarList => [
      BottomNavBarEntity(
        index: 0,
        title: 'Home',
        activeIcon: Assets.vectorsHome2,
        inActiveIcon: Assets.vectorsHome2,
      ),
      BottomNavBarEntity(
        index: 1,
        title: 'Notification',
        activeIcon: Assets.vectorsNotificationbing,
        inActiveIcon: Assets.vectorsNotificationbing,
      ),
      BottomNavBarEntity(
        index: 2,
        title: 'Orders',
        activeIcon: Assets.vectorsReceipt1,
        inActiveIcon: Assets.vectorsReceipt1,
      ),
      BottomNavBarEntity(
        index: 3,
        title: 'حسابي',
        activeIcon: Assets.vectorsProfile,
        inActiveIcon: Assets.vectorsProfile,
      ),
    ];

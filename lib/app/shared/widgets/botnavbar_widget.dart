import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:flutter/material.dart';

class BotNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BotNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: semiBoldText14,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: themeData.primaryColorDark,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.home,
            size: 24,
          ),
          activeIcon: Icon(
            Icons.home,
            size: 24,
            color: themeData.primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.list,
            size: 24,
          ),
          activeIcon: Icon(
            Icons.list,
            size: 24,
            color: themeData.primaryColor,
          ),
          label: 'Vehicle List',
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.person,
            size: 24,
          ),
          activeIcon: Icon(
            Icons.person,
            size: 24,
            color: themeData.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}

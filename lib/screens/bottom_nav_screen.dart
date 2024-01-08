import 'package:active_ally_fitness_zone_250/screens/notifications/notifications_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/recomendations/recomendations_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/settings_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/statistic_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/workouts/workouts_screen.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key, this.currentIndex = 0});
  final int currentIndex;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late int index = widget.currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.colorFF008A,
        backgroundColor: Colors.white,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        currentIndex: index,
        onTap: (indexFrom) async {
          setState(() {
            index = indexFrom;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.bottomIcon1,
              height: 25.h,
            ),
            activeIcon: Image.asset(
              AppImages.bottomIcon1Active,
              height: 25.h,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.bottomIcon2,
              height: 25.h,
            ),
            activeIcon: Image.asset(
              AppImages.bottomIcon2Active,
              height: 25.h,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.bottomIcon3,
              height: 25.h,
            ),
            activeIcon: Image.asset(
              AppImages.bottomIcon3Active,
              height: 25.h,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.bottomIcon4,
              height: 25.h,
            ),
            activeIcon: Image.asset(
              AppImages.bottomIcon4Active,
              height: 25.h,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.bottomIcon5,
              height: 25.h,
            ),
            activeIcon: Image.asset(
              AppImages.bottomIcon5Active,
              height: 25.h,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const WorkoutsScreen(),
  const StatisticScreen(),
  const RecomendationsScreen(),
  const NotificationsScreen(),
  const SettingsScreen(),
];

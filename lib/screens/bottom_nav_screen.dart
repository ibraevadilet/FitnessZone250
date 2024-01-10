import 'dart:math';

import 'package:active_ally_fitness_zone_250/screens/notifications/notifications_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/recomendations/recomendations_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/settings_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/logic/steps_repo.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/model/steps_model.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/statistic_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/workouts/workouts_screen.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sensors_plus/sensors_plus.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key, this.currentIndex = 0});
  final int currentIndex;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  int steps = 0;
  double exactDistance = 0.0;
  double calculateMagnitude(double x, double y, double z) {
    double distance = sqrt(x * x + y * y + z * z);
    return distance;
  }

  late int index = widget.currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEventStream(),
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            x = snapshort.data!.x;
            y = snapshort.data!.y;
            z = snapshort.data!.z;
            exactDistance = calculateMagnitude(x, y, z);
            if (exactDistance > 6) {
              steps++;
              StepsRepo.setSteps(
                StepsModel(
                  step: steps,
                  date: DateFormat('dd.MM.yyyy').format(
                    DateTime.now(),
                  ),
                ),
              );
            }
          }
          return pages[index];
        },
      ),
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

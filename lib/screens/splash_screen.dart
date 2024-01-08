import 'package:active_ally_fitness_zone_250/screens/bottom_nav_screen.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    toGoOnBoarFitnessZone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.splashLogo,
              height: 120.h,
            ),
          ),
        ],
      ),
    );
  }

  toGoOnBoarFitnessZone() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    // final isFirst = await FirstOpenFitnessZone.getFirstOpen();
    // if (!isFirst) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const OnBoardScreen(),
    //     ),
    //   );
    //   await Future.delayed(const Duration(seconds: 8));
    //   try {
    //     final InAppReview inAppReview = InAppReview.instance;
    //     if (await inAppReview.isAvailable()) {
    //       inAppReview.requestReview();
    //     }
    //   } catch (e) {
    //     throw Exception(e);
    //   }
    // } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavScreen(),
      ),
    );
    // }
  }
}
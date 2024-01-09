import 'package:active_ally_fitness_zone_250/screens/bottom_nav_screen.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:active_ally_fitness_zone_250/utils/premium/premium.dart';
import 'package:active_ally_fitness_zone_250/widgets/custom_button.dart';
import 'package:active_ally_fitness_zone_250/widgets/restore_widgets.dart';
import 'package:active_ally_fitness_zone_250/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, this.isClose = false});
  final bool isClose;

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool isBuing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.premiumImage,
            height: context.height,
            width: context.width,
            fit: BoxFit.cover,
          ),
          Container(
            height: context.height,
            width: context.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.6),
                  Colors.black,
                ],
              ),
            ),
          ),
          Positioned(
            top: 56.h,
            left: 20,
            right: 20,
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset(
                    AppImages.premLogo,
                    height: 80.h,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'ActiveAlly',
                    style: AppTextStylesFitnessZone.s24W700(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Elevate Your Fitness Journey\nWith Us!',
                    textAlign: TextAlign.center,
                    style: AppTextStylesFitnessZone.s20W500(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Our Best Features',
                          style: AppTextStylesFitnessZone.s20W600(),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.checkMarkIcon,
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Train with music',
                              style: AppTextStylesFitnessZone.s16W600(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.checkMarkIcon,
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Receive workout notification',
                              style: AppTextStylesFitnessZone.s16W600(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.checkMarkIcon,
                              height: 20.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Remove Ads',
                              style: AppTextStylesFitnessZone.s16W600(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        const Divider(color: Colors.black),
                        SizedBox(height: 10.h),
                        Text(
                          'Get access to all our features',
                          style: AppTextStylesFitnessZone.s14W400(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25,
            right: 20,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  if (widget.isClose) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavScreen(),
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SafeArea(
              child: Column(
                children: [
                  CustomButtonFitessZone(
                    height: 58.h,
                    color: AppColors.colorFF008A,
                    onPress: () async {
                      await PremiumFitnessZone.setPremium();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BottomNavScreen(),
                        ),
                        (route) => false,
                      );
                      // setState(() {
                      //   isBuing = true;
                      // });
                      // final apphudPaywalls = await Apphud.paywalls();

                      // await Apphud.purchase(
                      //   product: apphudPaywalls?.paywalls.first.products?.first,
                      // ).whenComplete(
                      //   () async {
                      //     if (await Apphud.hasPremiumAccess() ||
                      //         await Apphud.hasActiveSubscription()) {
                      //       await PremiumFitnessZone.buyFitnessZone(context);
                      //       Navigator.pushAndRemoveUntil(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (_) => const BottomNavScreen(),
                      //         ),
                      //         (route) => false,
                      //       );
                      //     }
                      //   },
                      // );
                      // setState(() {
                      //   isBuing = false;
                      // });
                    },
                    text: 'Buy Premium for \$0,99',
                    textStyle:
                        AppTextStylesFitnessZone.s20W600(color: Colors.white),
                    radius: 50,
                  ),
                  SizedBox(height: 24.h),
                  const RestoreButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

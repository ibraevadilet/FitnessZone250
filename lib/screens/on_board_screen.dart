import 'package:active_ally_fitness_zone_250/screens/premium_screen.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:active_ally_fitness_zone_250/utils/premium/first_open.dart';
import 'package:active_ally_fitness_zone_250/widgets/custom_button.dart';
import 'package:active_ally_fitness_zone_250/widgets/on_board_item_widget.dart';
import 'package:active_ally_fitness_zone_250/widgets/restore_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                currantPage = value;
              });
            },
            children: const [
              OnBoardItemWidget(
                image: AppImages.onBoard1,
                title: 'Welcome to\nActiveAlly!',
                sub: 'Your personal fitness assistant',
              ),
              OnBoardItemWidget(
                image: AppImages.onBoard2,
                title: 'Personal\nWorkouts for you',
                sub: 'Choose workouts based on your\ngoals and fitness level',
              ),
              OnBoardItemWidget(
                image: AppImages.onBoard3,
                title: 'Statistics of your\nactivity',
                sub:
                    'Track the regularity of your\nworkouts and steps taken per day',
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SafeArea(
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ScrollingDotsEffect(
                      activeDotColor: AppColors.colorFF008A,
                      dotColor: Colors.white,
                      dotHeight: 6,
                      dotWidth: 30.h,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomButtonFitessZone(
                    height: 58.h,
                    color: AppColors.colorFF008A,
                    onPress: () async {
                      if (currantPage == 2) {
                        await FirstOpenFitnessZone.setFirstOpen();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PremiumScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    text: 'NEXT',
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

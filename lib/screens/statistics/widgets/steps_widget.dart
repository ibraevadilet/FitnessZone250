import 'package:active_ally_fitness_zone_250/screens/statistics/logic/steps_repo.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:active_ally_fitness_zone_250/widgets/app_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StepsWidget extends StatefulWidget {
  const StepsWidget({
    super.key,
  });

  @override
  State<StepsWidget> createState() => _StepsWidgetState();
}

class _StepsWidgetState extends State<StepsWidget> {
  int todayStep = 0;
  int totalStep = 0;
  String toDay = DateFormat('dd.MM.yyyy').format(DateTime.now());
  bool isLoading = true;

  @override
  void initState() {
    getStaps();
    super.initState();
  }

  getStaps() async {
    final steps = await StepsRepo.getSteps();
    final todaySteps = steps.where((e) => e.date == toDay);
    if (todaySteps.isNotEmpty) {
      todayStep = todaySteps.first.step;
    }

    for (var e in steps) {
      totalStep += e.step;
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AppIndicatorFitessZone()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today`s steps',
                style: AppTextStylesFitnessZone.s20W500(),
              ),
              SizedBox(height: 15.h),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorFF008A,
                ),
                child: Row(
                  children: [
                    Text(
                      todayStep.toString(),
                      style: AppTextStylesFitnessZone.s32W600(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'steps',
                      style: AppTextStylesFitnessZone.s14W400(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      AppImages.stepIcon,
                      height: 40.h,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                'Total steps',
                style: AppTextStylesFitnessZone.s20W500(),
              ),
              SizedBox(height: 15.h),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorFF008A,
                ),
                child: Row(
                  children: [
                    Text(
                      totalStep.toString(),
                      style: AppTextStylesFitnessZone.s32W600(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'steps',
                      style: AppTextStylesFitnessZone.s14W400(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      AppImages.stepIcon,
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

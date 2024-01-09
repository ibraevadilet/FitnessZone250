import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today`s steps',
          style: AppTextStylesFitnessZone.s20W500(),
        ),
        SizedBox(height: 15.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorFF008A,
          ),
          child: Row(
            children: [
              Text(
                '0',
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorFF008A,
          ),
          child: Row(
            children: [
              Text(
                '0',
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

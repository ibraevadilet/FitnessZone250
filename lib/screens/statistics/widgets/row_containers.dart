import 'package:active_ally_fitness_zone_250/screens/statistics/logic/get_calory_cubit/get_calory_cubit.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/model/caloriy_model.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowContainers extends StatelessWidget {
  const RowContainers({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCaloryCubit, GetCaloryState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (error) => Center(
            child: Text(error),
          ),
          success: (model) => Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.colorFF008A,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            summWorkouts(model),
                            style: AppTextStylesFitnessZone.s32W600(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            AppImages.bottomIcon1Active,
                            height: 20.h,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'workouts\ncompleted',
                        style: AppTextStylesFitnessZone.s14W400(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.colorFF008A,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            summCalory(model),
                            style: AppTextStylesFitnessZone.s32W600(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            AppImages.calorIcon,
                            height: 20.h,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'calories\nburnes',
                        style: AppTextStylesFitnessZone.s14W400(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String summCalory(List<CaloryModel> model) {
  int summ = 0;
  for (var e in model) {
    summ += e.calory;
  }
  return summ.toString();
}

String summWorkouts(List<CaloryModel> model) {
  int summ = 0;
  for (var e in model) {
    summ += e.count;
  }
  return summ.toString();
}

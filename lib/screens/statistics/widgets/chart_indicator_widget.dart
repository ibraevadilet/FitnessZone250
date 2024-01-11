import 'package:active_ally_fitness_zone_250/screens/statistics/logic/get_calory_cubit/get_calory_cubit.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/widgets/row_containers.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:active_ally_fitness_zone_250/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChartIndicatorWidget extends StatefulWidget {
  const ChartIndicatorWidget({super.key});

  @override
  State<ChartIndicatorWidget> createState() => _ChartIndicatorWidgetState();
}

class _ChartIndicatorWidgetState extends State<ChartIndicatorWidget> {
  String selectedDate = '';
  int maxChartHeight = 150;
  int maxCal = 0;

  ValueNotifier<int> allSumm = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          height: 250.h,
          child: BlocConsumer<GetCaloryCubit, GetCaloryState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (model) {
                  allSumm.value = int.parse(summCalory(model));
                  maxCal = 0;
                  selectedDate = model.last.date;
                  for (var e in model) {
                    if (e.calory > maxCal) {
                      maxCal = e.calory;
                    }
                  }
                },
              );
            },
            builder: (context, state) {
              return state.when(
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                error: (error) => Center(
                  child: Text(error),
                ),
                success: (model) => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: model
                        .map<Widget>(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = e.date;
                              });
                            },
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (selectedDate == e.date)
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppImages.fireIcon,
                                            height: 15.h,
                                          ),
                                          Text(
                                            '${e.calory} kcal',
                                            style: AppTextStylesFitnessZone
                                                .s16W600(),
                                          ),
                                          Image.asset(
                                            AppImages.todayIcon,
                                            height: 17.h,
                                          ),
                                        ],
                                      ),
                                    const SizedBox(height: 5),
                                    Container(
                                      height: e.calory == 0
                                          ? 5.h
                                          : contHeight(maxCal, e.calory).h,
                                      width: 15.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.colorFF008A,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      model.length < 8
                                          ? DateFormat('E')
                                              .format(
                                                DateFormat('dd.MM.yyyy')
                                                    .parse(e.date),
                                              )
                                              .toUpperCase()
                                          : DateFormat('dd.MM')
                                              .format(
                                                DateFormat('dd.MM.yyyy')
                                                    .parse(e.date),
                                              )
                                              .toUpperCase(),
                                      style: AppTextStylesFitnessZone.s16W600(
                                        color: selectedDate == e.date
                                            ? AppColors.colorFF008A
                                            : Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                SizedBox(width: 13.w),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ),
        ValueListenableBuilder(
          valueListenable: allSumm,
          builder: (context, value, child) {
            if (value == 0) {
              return Text(
                'No indicators yet',
                style: AppTextStylesFitnessZone.s15W500(
                  color: Colors.black.withOpacity(
                    0.5,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  double contHeight(int maxCal, int cal) {
    double height = 0;
    int maxHei = 150;

    height = (cal * maxHei) / maxCal;

    return height;
  }
}

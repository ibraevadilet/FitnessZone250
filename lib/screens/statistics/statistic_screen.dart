import 'package:active_ally_fitness_zone_250/screens/statistics/logic/get_calory_cubit/get_calory_cubit.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/widgets/chart_indicator_widget.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/widgets/row_containers.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/widgets/steps_widget.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  List<String> tabsVal = ['WEEK', 'MONTH', 'ALL TIME'];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCaloryCubit(),
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: SafeArea(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                Text(
                  'Statistics',
                  style: AppTextStylesFitnessZone.s30W700(),
                ),
                Text(
                  'Track the regularity of your workouts',
                  style: AppTextStylesFitnessZone.s18W500(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 20.h),
                const RowContainers(),
                SizedBox(height: 25.h),
                Builder(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                    child: TabBar(
                      onTap: (value) {
                        context.read<GetCaloryCubit>().getCalory(value);
                      },
                      padding: const EdgeInsets.all(2),
                      indicator: BoxDecoration(
                        color: AppColors.colorFF008A,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      unselectedLabelColor: Colors.black.withOpacity(0.5),
                      unselectedLabelStyle: AppTextStylesFitnessZone.s16W600(),
                      labelStyle: AppTextStylesFitnessZone.s16W600(),
                      tabs: tabsVal.map<Widget>((e) => Tab(text: e)).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                const ChartIndicatorWidget(),
                SizedBox(height: 25.h),
                const StepsWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

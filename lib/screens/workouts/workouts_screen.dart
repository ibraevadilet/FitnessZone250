import 'package:active_ally_fitness_zone_250/screens/workouts/choose_difficulty_page.dart';
import 'package:active_ally_fitness_zone_250/screens/workouts/cubit/workout_cubit.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WorkoutCubit, WorkoutState>(
          bloc: WorkoutCubit()..getData(),
          builder: (context, state) => state.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (data) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Personal workouts',
                      style: AppTextStylesFitnessZone.s30W700(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Choose workouts based on your goals',
                      style: AppTextStylesFitnessZone.s18W500(
                          color: Colors.black.withOpacity(0.6)),
                    ),
                    const SizedBox(height: 20),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseDifficultyPage(
                                      data: data[index],
                                    ))),
                        child: Stack(
                          children: [
                            Container(
                              height: 200.h,
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width - 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(
                                data[index].image!,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0),
                                          Colors.black.withOpacity(1)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Text(
                                  data[index].title!,
                                  style: AppTextStylesFitnessZone.s20W600(
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            error: (error) => Center(
              child: Text(error),
            ),
          ),
        ),
      ),
    );
  }
}

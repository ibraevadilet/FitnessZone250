import 'package:active_ally_fitness_zone_250/screens/recomendations/rec_logic/app_loading.dart';
import 'package:active_ally_fitness_zone_250/screens/recomendations/rec_logic/cached_image_widget.dart';
import 'package:active_ally_fitness_zone_250/screens/recomendations/rec_logic/cubit/get_rec_cubit.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RecomendationsScreen extends StatelessWidget {
  const RecomendationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetRecCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommendations',
                  style: AppTextStylesFitnessZone.s30W700(),
                ),
                Text(
                  'Nutrition advices during trainings',
                  style: AppTextStylesFitnessZone.s18W500(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<GetRecCubit, GetRecState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppLoadingWidget(),
                        error: (error) => const Center(
                          child: Text('error'),
                        ),
                        success: (model) => GridView.builder(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 217,
                          ),
                          itemCount: model.length,
                          physics: const ScrollPhysics(
                            parent: ClampingScrollPhysics(),
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              AnimationConfiguration.staggeredGrid(
                            columnCount: 14,
                            position: index,
                            delay: const Duration(milliseconds: 90),
                            child: SlideAnimation(
                              verticalOffset: 500.0,
                              child: FadeInAnimation(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(milliseconds: 1500),
                                child: CachedImageWidget(
                                  model: model[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

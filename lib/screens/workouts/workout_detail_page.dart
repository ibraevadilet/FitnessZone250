import 'package:active_ally_fitness_zone_250/screens/premium_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/workouts/exercise_page.dart';
import 'package:active_ally_fitness_zone_250/screens/workouts/models/workout_model.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/premium/premium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WorkoutDetailPage extends StatelessWidget {
  const WorkoutDetailPage(
      {super.key, required this.data, required this.level, required this.time});
  final WorkoutModel data;
  final String level;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            expandedHeight: 405.h,
            actions: [
              IconButton(
                // iconSize: ,
                onPressed: () {
                  showMusic(cont: context);
                },
                icon: Container(
                  margin: const EdgeInsets.only(),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xffFF008A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.double_music_note,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            leading: IconButton(
              // iconSize: ,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                margin: const EdgeInsets.only(
                    // left: 20,
                    ),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xff161621),
                  ),
                ),
              ),
            ),
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                            data.image!,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title!,
                              style: AppTextStylesFitnessZone.s20W600(
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              text: TextSpan(
                                text: data.kcal,
                                style: AppTextStylesFitnessZone.s12W400(
                                    color: const Color(0xffFF008A)),
                                children: [
                                  TextSpan(
                                    text: ' \u2022 ',
                                    style: AppTextStylesFitnessZone.s12W400(
                                        color: const Color(0xffFFFFFF)),
                                  ),
                                  TextSpan(
                                    text: '$time min',
                                    style: AppTextStylesFitnessZone.s12W400(
                                        color: const Color(0xffFFFFFF)),
                                  ),
                                  TextSpan(
                                    text: ' \u2022 ',
                                    style: AppTextStylesFitnessZone.s12W400(
                                        color: const Color(0xffFFFFFF)),
                                  ),
                                  TextSpan(
                                    text: '$level level',
                                    style: AppTextStylesFitnessZone.s12W400(
                                        color: const Color(0xffFFFFFF)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 42.h,
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  left: 30,
                  right: 30,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExercisePage(
                                  time: time,
                                  data: data,
                                ))),
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffFF008A),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'START',
                          style: AppTextStylesFitnessZone.s20W600(
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Description',
                      style: AppTextStylesFitnessZone.s16W500(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      data.description!,
                      style: AppTextStylesFitnessZone.s15W400(),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Exercises',
                      style: AppTextStylesFitnessZone.s16W500(),
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      itemBuilder: (context, index) => Container(
                        height: 90.h,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: Row(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.network(data.image!),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  data.exercises![index].title!,
                                  style: AppTextStylesFitnessZone.s15W500(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  data.title!,
                                  style: AppTextStylesFitnessZone.s10W400(
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.timer_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '2 min',
                                      style: AppTextStylesFitnessZone.s10W400(
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 3),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: data.exercises!.length,
                    ),
                    SizedBox(
                      height: 32.h,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Future showMusic({
    required BuildContext cont,
  }) async {
    await showModalBottomSheet(
      context: cont,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    'Music',
                    style: AppTextStylesFitnessZone.s24W600(),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.clear_thick,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              MasonryGridView.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                crossAxisCount: 2,
                itemBuilder: (context, index) => InkWell(
                    onTap: () async {
                      final bool isPremium =
                          await PremiumFitnessZone.getPremium();
                      if (!isPremium) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PremiumScreen(
                              isClose: true,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                              time: time,
                              data: data,
                              musicUrl:
                                  'https://eu.hitmotop.com/get/music/20170905/Classical_Study_Music_Meditation_Relaxing_Music_Relaxing_Piano_Music_Lyudvig_van_Betkhoven_-_Moonlight_Sonata_48242243.mp3',
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 220.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF5F5F5),
                          image: const DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(
                                'https://i.ibb.co/fnSD9mc/Rectangle-7.png',
                              ))),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: Container(
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.15),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, bottom: 20, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Step higher',
                                      style: AppTextStylesFitnessZone.s16W700(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '3 min',
                                      style: AppTextStylesFitnessZone.s14W400(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  // iconSize: ,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        // left: 20,
                                        ),
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFF008A),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    ).whenComplete(() {});
  }
}

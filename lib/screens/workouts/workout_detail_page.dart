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
                  height: 35.h,
                  width: 35.w,
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
                height: 35.h,
                width: 35.w,
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
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 30.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100.h,
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
                            SizedBox(height: 6.h),
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
                  left: 30.w,
                  right: 30.w,
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
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
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
                    SizedBox(height: 16.h),
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
                                SizedBox(height: 8.h),
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
                                    Icon(
                                      Icons.timer_outlined,
                                      color: Colors.white,
                                      size: 15.h,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '2 min',
                                      style: AppTextStylesFitnessZone.s10W400(
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 3.w),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                              ],
                            ),
                            SizedBox(width: 16.w),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
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
                itemCount: _list.length,
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
                              musicUrl: _list[index]['url'],
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        _list[index]['title']!,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStylesFitnessZone.s16W700(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        _list[index]['time']!,
                                        style: AppTextStylesFitnessZone.s14W400(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
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

const _list = [
  {
    "title": "Moonlight Sonata",
    "time": "04:50",
    "url":
        "https://eu.hitmotop.com/get/music/20170905/Classical_Study_Music_Meditation_Relaxing_Music_Relaxing_Piano_Music_Lyudvig_van_Betkhoven_-_Moonlight_Sonata_48242243.mp3"
  },
  {
    "title": "Wind Spirits",
    "time": "04:05",
    "url":
        "https://eu.hitmotop.com/get/music/20170903/Meditation_Best_Relaxing_Spa_Music_Legends_Of_The_Drum_-_Wind_Spirits_48069509.mp3"
  },
  {
    "title": "Fur Elise",
    "time": "03:17",
    "url":
        "https://eu.hitmotop.com/get/music/20170905/Classical_Study_Music_Meditation_Relaxing_Music_Relax_Lyudvig_van_Betkhoven_-_Fur_Elise_48242143.mp3"
  },
  {
    "title": "Ten minute nirvana",
    "time": "10:37",
    "url":
        "https://eu.hitmotop.com/get/music/20170904/Meditation_Massage_Tribe_Yoga_Best_Relaxing_Spa_Music_Zen_Meditation_and_Natural_White_Noise_and_New_Age_-_Ten_Minute_Nirvana_10_Minutes_of_Double_Flutes_Showers_48120520.mp3"
  },
  {
    "title": "Prelude",
    "time": "06:40",
    "url":
        "https://eu.hitmotop.com/get/music/20170905/Classical_Study_Music_Meditation_Relaxing_Music_Relax_The_ONeill_Brothers_Group_Iogann_Sebastyan_Bakh_-_Prelude_Bach_48242165.mp3"
  },
  {
    "title": "Enigma",
    "time": "01:23",
    "url":
        "https://eu.hitmotop.com/get/music/20170922/Meditation_-_Enigma_48837040.mp3"
  },
  {
    "title": "Exploring the soul",
    "time": "11:00",
    "url":
        "https://eu.hitmotop.com/get/music/20170904/Meditation_Best_Relaxing_Spa_Music_Yoga_Tribe_Jessita_Reyes_Zodiac_Tribe_-_Exploring_The_Soul_11_Minutes_of_Zen_Flute_Nature_Sounds_48120487.mp3"
  },
  {
    "title": "Early Morning Centering",
    "time": "06:17",
    "url":
        "https://eu.hitmotop.com/get/music/20170904/Meditation_Reading_and_Studying_Music_Deep_Sleep_Best_Relaxing_Spa_Music_Yoga_Tribe_Zen_Meditation_and_Natural_White_Noise_and_New_Age_-_Early_Morning_Centering_Native_American_flute_with_Sounds_of_Nature_48120524.mp3"
  }
];

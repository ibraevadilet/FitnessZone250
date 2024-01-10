import 'dart:async';
import 'dart:developer';

import 'package:active_ally_fitness_zone_250/screens/bottom_nav_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/logic/get_calory_repo.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/model/caloriy_model.dart';
import 'package:active_ally_fitness_zone_250/screens/workouts/models/workout_model.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage(
      {super.key, required this.data, this.musicUrl, required this.time});
  final WorkoutModel data;
  final String? musicUrl;
  final String time;

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final PageController _pageController = PageController();
  late AudioPlayer player;
  Timer? countdownTimer;
  Duration? duration;
  String? time;

  @override
  void initState() {
    player = AudioPlayer();
    loadAudio();
    duration = parseDuration('${widget.time}:00');
    super.initState();
  }

  Future<void> loadAudio() async {
    if (widget.musicUrl != null) {
      try {
        await player.setUrl(widget.musicUrl!);
        await player.play();
        print('player ${player.playing}');
      } catch (e) {
        log('data: 1 ');
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startTimerEnter(context);
  }

  void startTimerEnter(BuildContext context) {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
    }
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        const reduceSecondsBy = 1;
        final seconds = duration!.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer?.cancel();
        } else {
          duration = Duration(seconds: seconds);
          duratinParseToString();
        }
      });
    });
  }

  void duratinParseToString() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(duration!.inMinutes.remainder(60));
    final seconds = strDigits(duration!.inSeconds.remainder(60));
    time = '$minutes:$seconds';
  }

  Duration parseDuration(String s) {
    var minutes = 0;
    int seconds;
    final parts = s.split(':');
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    seconds = int.parse(parts[parts.length - 1]);
    return Duration(minutes: minutes, seconds: seconds);
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    countdownTimer?.cancel();
  }

  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                currantPage = value;
              },
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              // onPageChanged: (value) => selectedBannerPage.value = value,
              itemCount: widget.data.exercises!.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: 300.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.network(
                              widget.data.image!,
                              width: double.maxFinite,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 64,
                            child: IconButton(
                              // iconSize: ,
                              onPressed: () {
                                var nextPage =
                                    _pageController.page!.round() - 1;
                                print('+++++++ $nextPage');
                                if (0 > nextPage) {
                                  Navigator.pop(context);
                                } else {
                                  _pageController.animateToPage(
                                    nextPage,
                                    duration: kTabScrollDuration,
                                    curve: Curves.easeIn,
                                  );
                                }
                              },
                              icon: Container(
                                margin: const EdgeInsets.only(
                                    // left: 20,
                                    ),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.6),
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
                          ),
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.black.withOpacity(0),
                                      Colors.black.withOpacity(1)
                                    ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${index + 1} of 5',
                                        style: AppTextStylesFitnessZone.s24W700(
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 30.h),
                                      Text(
                                        widget.data.exercises![index].title!,
                                        style: AppTextStylesFitnessZone.s20W500(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      const Spacer(
                        flex: 8,
                      ),
                      Image.asset('assets/images/timer.png', height: 100.h),
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        time ?? '',
                        style: AppTextStylesFitnessZone.s32W800(
                            color: Colors.white),
                      ),
                      const Spacer(
                        flex: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.data.exercises![index].description!,
                          textAlign: TextAlign.center,
                          style: AppTextStylesFitnessZone.s16W400(
                              color: Colors.white),
                        ),
                      ),
                      const Spacer(
                        flex: 8,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () async {
              if (currantPage == widget.data.exercises!.length - 1) {
                await CaloryRepo.setCalory(
                  CaloryModel(
                    count: 1,
                    calory: int.parse(widget.data.kcal!.split(' ').first),
                    date: DateFormat('dd.MM.yyyy').format(DateTime.now()),
                  ),
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavScreen(),
                  ),
                  (route) => false,
                );
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 60.h,
              decoration: BoxDecoration(
                color: const Color(0xffFF008A),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  'NEXT',
                  style: AppTextStylesFitnessZone.s20W600(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

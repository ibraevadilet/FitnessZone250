import 'package:active_ally_fitness_zone_250/screens/workouts/models/workout_model.dart';
import 'package:active_ally_fitness_zone_250/screens/workouts/workout_detail_page.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseDifficultyPage extends StatelessWidget {
  const ChooseDifficultyPage({super.key, required this.data});
  final WorkoutModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          data.title!,
          style: AppTextStylesFitnessZone.s24W600(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Choose difficulty level',
                style: AppTextStylesFitnessZone.s18W500(
                    color: Colors.black.withOpacity(0.6)),
              ),
              const SizedBox(height: 20),
              _item(context, data.image!, 'Beginner', '10'),
              const SizedBox(height: 20),
              _item(context, data.image!, 'Medium', '15'),
              const SizedBox(height: 20),
              _item(context, data.image!, 'Advanced', '20'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(BuildContext context, String image, String title, String time) =>
      GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WorkoutDetailPage(data: data, level: title, time: time))),
        child: Stack(
          children: [
            Container(
              height: 200.h,
              clipBehavior: Clip.antiAlias,
              width: MediaQuery.of(context).size.width - 32,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 70.h,
              bottom: 70.h,
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                      color: Colors.black.withOpacity(0.5))
                ]),
                child: Center(
                  child: Text(
                    title,
                    style:
                        AppTextStylesFitnessZone.s20W600(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}

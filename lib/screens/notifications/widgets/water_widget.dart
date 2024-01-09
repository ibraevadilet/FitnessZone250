import 'package:active_ally_fitness_zone_250/screens/notifications/font_sizer.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/notifications_screen.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/widgets/cupertino_modal.dart';
import 'package:active_ally_fitness_zone_250/screens/notifications/widgets/drink_widget.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'mega_text_animation.dart';

class WaterWidget extends StatefulWidget {
  const WaterWidget({super.key});

  @override
  State<WaterWidget> createState() => _WaterWidgetState();
}

class _WaterWidgetState extends State<WaterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MegaTweenAnimations.appearWidget(
          duration: const Duration(milliseconds: 600),
          child: GestureDetector(
            onTap: () => showAlertDialog(
              context,
              title: 'Goal',
              titleSub: 'Set your daily goal',
              cancel: 'cancel',
              save: 'save',
            ).then((value) {
              today += value ?? 0;
              setState(() {});
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Set your daily goal',
                  textScaleFactor: FontSizer.textScaleFactor(context),
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6000000238418579),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset(
                  AppImages.add,
                  scale: 4.5,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        Container(
          width: 335,
          height: 190,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 5,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MegaTweenAnimations.scaleWidget(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        'Water consumption',
                        textScaleFactor: FontSizer.textScaleFactor(context),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Image.asset(
                      AppImages.glass,
                      scale: 4,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Today:',
                      textScaleFactor: FontSizer.textScaleFactor(context),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 10),
                    MegaTweenAnimations.scaleWidget(
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        '${today}ml',
                        textScaleFactor: FontSizer.textScaleFactor(context),
                        style: const TextStyle(
                          color: Color(0xFFFF0089),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    Text(
                      'Your goal:',
                      textScaleFactor: FontSizer.textScaleFactor(context),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 10),
                    MegaTweenAnimations.scaleWidget(
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        '${goal}ml',
                        textScaleFactor: FontSizer.textScaleFactor(context),
                        style: const TextStyle(
                          color: Color(0xFFFF0089),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<int>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return DrinkWidget(
                          goalMl: (int value) {
                            goal += value;
                            setState(() {});
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                      height: 35.h,
                      width: 95.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffFF008A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Drink',
                        textAlign: TextAlign.center,
                        textScaleFactor: FontSizer.textScaleFactor(context),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

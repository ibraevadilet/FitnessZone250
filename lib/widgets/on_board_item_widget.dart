import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/widgets/spaces.dart';
import 'package:flutter/material.dart';

class OnBoardItemWidget extends StatelessWidget {
  const OnBoardItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.sub,
  });

  final String image;
  final String title;
  final String sub;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          height: context.height,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStylesFitnessZone.s36W700(),
                ),
                const SizedBox(height: 12),
                Text(
                  sub,
                  style: AppTextStylesFitnessZone.s20W500(),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: context.height,
          width: context.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

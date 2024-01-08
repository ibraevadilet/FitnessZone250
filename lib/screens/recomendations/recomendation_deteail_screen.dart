import 'package:active_ally_fitness_zone_250/screens/recomendations/rec_logic/rec_model.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:active_ally_fitness_zone_250/utils/images/app_images.dart';
import 'package:active_ally_fitness_zone_250/widgets/app_indicator.dart';
import 'package:active_ally_fitness_zone_250/widgets/spaces.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class RecomendationDeteailScreen extends StatelessWidget {
  const RecomendationDeteailScreen({super.key, required this.model});
  final RecModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: model.image,
                placeholder: (_, url) {
                  return SizedBox(
                    height: 300.h,
                    width: context.width,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.4),
                      highlightColor: Colors.white,
                      child: Container(
                        height: 300.h,
                        width: context.width,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const AppIndicatorFitessZone(),
                      ),
                    ),
                  );
                },
                imageBuilder: (_, imageProvider) {
                  return Container(
                    height: 300.h,
                    width: context.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          model.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 15,
                left: 20,
                right: 20,
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppImages.backButtonIcon,
                          height: 35.h,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Share.share(model.image);
                        },
                        child: Image.asset(
                          AppImages.shareIcon,
                          height: 35.h,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                children: [
                  Text(
                    model.title,
                    style: AppTextStylesFitnessZone.s24W600(),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    model.description,
                    style: AppTextStylesFitnessZone.s16W400(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

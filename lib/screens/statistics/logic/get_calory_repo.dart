import 'package:active_ally_fitness_zone_250/screens/statistics/model/caloriy_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CaloryRepo {
  static Future<List<CaloryModel>> getCalory() async {
    var box = await Hive.openBox<CaloryModel>('calory');
    return box.values.toList();
  }

  static Future<void> setCalory(CaloryModel model) async {
    var box = await Hive.openBox<CaloryModel>('calory');
    final savedCalories = box.values.toList();

    if (savedCalories.isNotEmpty) {
      print('savedCalories.isNotEmpty');

      final nowDateList = savedCalories.where((e) => e.date == model.date);
      if (nowDateList.isNotEmpty) {
        nowDateList.first.calory += model.calory;
        nowDateList.first.count++;
        nowDateList.first.save();
        print('if (e.date == model.date)');
      } else {
        box.add(model);
        print('else (e.date != model.date)');
      }
    } else {
      print('else savedCalories.isNotEmpty');
      box.add(model);
    }
  }
}

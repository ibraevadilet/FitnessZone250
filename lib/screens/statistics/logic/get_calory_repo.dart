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
      for (var e in savedCalories) {
        if (e.date == model.date) {
          e.calory += model.calory;
          e.count++;
          e.save();
        } else {
          box.add(model);
        }
      }
    } else {
      box.add(model);
    }
  }
}

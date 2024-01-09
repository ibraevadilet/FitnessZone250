import 'package:active_ally_fitness_zone_250/screens/statistics/model/steps_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StepsRepo {
  static Future<List<StepsModel>> getSteps() async {
    var box = await Hive.openBox<StepsModel>('step');
    return box.values.toList();
  }

  static Future<void> setSteps(StepsModel model) async {
    var box = await Hive.openBox<StepsModel>('step');
    final savedSteps = box.values.toList();

    if (savedSteps.isNotEmpty) {
      for (var e in savedSteps) {
        if (e.date == model.date) {
          e.step = model.step;
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

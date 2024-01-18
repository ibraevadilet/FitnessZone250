import 'package:active_ally_fitness_zone_250/logic_prem/get_premium/prem_hive_model/prem_hive_model.dart';
import 'package:hive/hive.dart';

class GetPremHiveRepo {
  Future<NewPosterModel?> getData() async {
    final box = await Hive.openBox<NewPosterModel>('prem');
    final result = box.get('keyPrem');
    return result;
  }

  setData(NewPosterModel model) async {
    final box = await Hive.openBox<NewPosterModel>('prem');
    box.put('keyPrem', model);
  }
}

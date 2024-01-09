import 'package:hive/hive.dart';

part 'steps_model.g.dart';

@HiveType(typeId: 0)
class StepsModel extends HiveObject {
  @HiveField(0)
  int step;

  @HiveField(1)
  String date;

  StepsModel({
    required this.step,
    required this.date,
  });
}

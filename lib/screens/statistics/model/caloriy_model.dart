import 'package:hive/hive.dart';

part 'caloriy_model.g.dart';

@HiveType(typeId: 0)
class CaloryModel extends HiveObject {
  @HiveField(0)
  int calory;

  @HiveField(1)
  String date;
  @HiveField(2)
  int count;

  CaloryModel({
    required this.calory,
    required this.date,
    this.count = 1,
  });
}

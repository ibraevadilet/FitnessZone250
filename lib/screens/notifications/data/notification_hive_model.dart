// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'notification_hive_model.g.dart';

@HiveType(typeId: 2)
class NotificationHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String date;
  @HiveField(2)
  bool? chek;

  NotificationHiveModel({
    required this.id,
    required this.date,
    required this.chek
  });

  @override
  String toString() => 'NotificationHiveModel(id: $id, date: $date, date: $chek)';
}

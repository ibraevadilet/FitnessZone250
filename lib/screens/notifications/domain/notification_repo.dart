import 'package:active_ally_fitness_zone_250/screens/notifications/data/notification_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class NotificationRepo {
  Future<List<NotificationHiveModel>> getNotification();
  Future<void> setNotification(NotificationHiveModel notificationHiveModel);
  Future<void> setUpadteNotificationChek(int id, bool chek);
}

class NotificationRepoImpl implements NotificationRepo {
  @override
  Future<List<NotificationHiveModel>> getNotification() async {
    final notificationBox =
        await Hive.openBox<NotificationHiveModel>('notificationBox');
    return notificationBox.values.toList();
  }

  @override
  Future<void> setNotification(
      NotificationHiveModel notificationHiveModel) async {
    final notificationBox =
        await Hive.openBox<NotificationHiveModel>('notificationBox');
    await notificationBox.add(notificationHiveModel);
  }

  @override
  Future<void> setUpadteNotificationChek(int id, bool chek) async {
    final notificationBox =
        await Hive.openBox<NotificationHiveModel>('notificationBox');
    List<NotificationHiveModel> listNotification =
        notificationBox.values.where((e) => e.id == id).toList();
    listNotification.first.chek = chek;
    await listNotification.first.save();
  }
}

import 'dart:developer';

import 'package:active_ally_fitness_zone_250/screens/notifications/data/notification_hive_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'get_notification_cubit.freezed.dart';
part 'get_notification_state.dart';

class GetNotificationCubit extends Cubit<GetNotificationState> {
  GetNotificationCubit() : super(const GetNotificationState.loading());

  getAllNotificationist() async {
    emit(const GetNotificationState.loading());
    try {
      final notificationBox =
          await Hive.openBox<NotificationHiveModel>('notificationBox');

      final notifList = notificationBox.values.toList();
      log('data: notifList: $notifList ');
      emit(GetNotificationState.success(notifList));
    } catch (e) {
      log('data: e: $e ');
      emit(GetNotificationState.error(e.toString()));
    }
  }

  setNotification(NotificationHiveModel notificationHiveModel) async {
    emit(const GetNotificationState.loading());
    try {
      // emit(const GetNotificationState.success());
      final notificationBox =
          await Hive.openBox<NotificationHiveModel>('notificationBox');
      await notificationBox.add(notificationHiveModel);
      getAllNotificationist();
    } catch (e) {
      emit(GetNotificationState.error(e.toString()));
    }
  }

  setUpadteNotificationChek(int id, bool chek) async {
    try {
      final notificationBox =
          await Hive.openBox<NotificationHiveModel>('notificationBox');
      List<NotificationHiveModel> listNotification =
          notificationBox.values.where((e) => e.id == id).toList();
      listNotification.first.chek = chek;
      await listNotification.first.save();
      getAllNotificationist();
    } catch (e) {
      emit(GetNotificationState.error(e.toString()));
    }
  }
}

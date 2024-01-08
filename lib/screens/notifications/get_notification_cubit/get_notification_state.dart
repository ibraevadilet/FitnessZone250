part of 'get_notification_cubit.dart';

@freezed
class GetNotificationState with _$GetNotificationState {
  const factory GetNotificationState.loading() = _LoadingNotification;
  const factory GetNotificationState.error(String error) = _ErrorNotification;
  const factory GetNotificationState.success(List<NotificationHiveModel> model) = _SuccessNotification;
  const factory GetNotificationState.success2() = _SuccessNotification2;
}

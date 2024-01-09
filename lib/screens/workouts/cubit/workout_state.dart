part of 'workout_cubit.dart';

@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState.loading() = _Loading;
  const factory WorkoutState.loaded(List<WorkoutModel> data) = _Loaded;
  const factory WorkoutState.error(String message) = _Error;
}

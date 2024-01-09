import 'package:active_ally_fitness_zone_250/screens/workouts/models/workout_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_state.dart';
part 'workout_cubit.freezed.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(const WorkoutState.loading());

  getData() async {
    try {
      final result = await Dio().get(
          'https://fitness-zone-250-default-rtdb.firebaseio.com//workouts.json?auth=AIzaSyB5ZSZo0vkfJysrZCn-Z7hBD9dvllGJBmQ');
      final listModel = result.data
          .map<WorkoutModel>(
            (e) => WorkoutModel.fromJson(e),
          )
          .toList();

      emit(WorkoutState.loaded(listModel));
    } catch (e) {
      emit(WorkoutState.error(e.toString()));
    }
  }
}

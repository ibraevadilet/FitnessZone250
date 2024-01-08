import 'package:active_ally_fitness_zone_250/screens/recomendations/rec_logic/rec_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_rec_cubit.freezed.dart';
part 'get_rec_state.dart';

class GetRecCubit extends Cubit<GetRecState> {
  GetRecCubit() : super(const GetRecState.loading()) {
    getRecs();
  }
  final dio = Dio();

  getRecs() async {
    emit(const GetRecState.loading());
    try {
      final result = await dio.get(
          'https://fitness-zone-250-default-rtdb.firebaseio.com//recomendations.json?auth=AIzaSyB5ZSZo0vkfJysrZCn-Z7hBD9dvllGJBmQ');
      final listModel = result.data
          .map<RecModel>(
            (e) => RecModel.fromJson(e),
          )
          .toList();

      emit(GetRecState.success(listModel));
    } catch (e) {
      emit(GetRecState.error(e.toString()));
    }
  }
}

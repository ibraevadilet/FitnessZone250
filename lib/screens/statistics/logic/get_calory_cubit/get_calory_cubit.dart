import 'package:active_ally_fitness_zone_250/screens/statistics/logic/get_calory_repo.dart';
import 'package:active_ally_fitness_zone_250/screens/statistics/model/caloriy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'get_calory_cubit.freezed.dart';
part 'get_calory_state.dart';

class GetCaloryCubit extends Cubit<GetCaloryState> {
  GetCaloryCubit() : super(const GetCaloryState.loading()) {
    getCalory(0);
  }

  List<DateTime> generateDateWeek() {
    List<DateTime> dateList = [];
    DateTime now = DateTime.now();

    for (int i = 0; i < 7; i++) {
      dateList.add(now.subtract(Duration(days: i)));
    }

    return dateList;
  }

  List<DateTime> generateDateMonth() {
    List<DateTime> dateList = [];
    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);

    while (now.isAfter(firstDayOfMonth)) {
      dateList.add(now);
      now = now.subtract(const Duration(days: 1));
    }

    return dateList;
  }

  getCalory(int index) async {
    emit(const GetCaloryState.loading());
    try {
      List<CaloryModel> result = await CaloryRepo.getCalory();

      if (index == 0) {
        if (result.isEmpty) {
          for (var i = 0; i < generateDateWeek().length; i++) {
            result.add(
              CaloryModel(
                calory: 0,
                date: DateFormat('dd.MM.yyyy')
                    .format(generateDateWeek()[i])
                    .toString(),
              ),
            );
          }
        } else if (result.length < 7) {
          for (var i = 0; i < 7 - result.length; i++) {
            result.add(
              CaloryModel(
                calory: 0,
                date: DateFormat('dd.MM.yyyy')
                    .parse(result.last.date)
                    .subtract(
                      const Duration(days: 1),
                    )
                    .toString(),
              ),
            );
          }
        } else {
          result = List.from(result.sublist(0, 6));
        }
      } else if (index == 1) {
        if (result.isEmpty) {
          for (var i = 0; i < generateDateMonth().length; i++) {
            result.add(
              CaloryModel(
                calory: 0,
                date: DateFormat('dd.MM.yyyy')
                    .format(generateDateMonth()[i])
                    .toString(),
              ),
            );
          }
        } else if (result.length < generateDateMonth().length) {
          for (var i = 0; i < generateDateMonth().length - result.length; i++) {
            result.add(
              CaloryModel(
                calory: 0,
                date: DateFormat('dd.MM.yyyy')
                    .parse(result.last.date)
                    .subtract(
                      const Duration(days: 1),
                    )
                    .toString(),
              ),
            );
          }
        }
      } else if (index == 2) {
        if (result.isEmpty) {
          for (var i = 0; i < generateDateWeek().length; i++) {
            result.add(
              CaloryModel(
                calory: 0,
                date: DateFormat('dd.MM.yyyy')
                    .format(generateDateWeek()[i])
                    .toString(),
              ),
            );
          }
        }
      }

      emit(GetCaloryState.success(result.reversed.toList()));
    } catch (e) {
      emit(GetCaloryState.error(e.toString()));
    }
  }
}

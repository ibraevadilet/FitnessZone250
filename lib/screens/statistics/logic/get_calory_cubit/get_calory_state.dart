part of 'get_calory_cubit.dart';

@freezed
class GetCaloryState with _$GetCaloryState {
  const factory GetCaloryState.loading() = _Loading;
  const factory GetCaloryState.error(String error) = _Error;
  const factory GetCaloryState.success(List<CaloryModel> model) = _Success;
}

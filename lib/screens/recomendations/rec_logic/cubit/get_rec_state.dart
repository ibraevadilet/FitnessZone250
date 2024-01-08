part of 'get_rec_cubit.dart';

@freezed
class GetRecState with _$GetRecState {
  const factory GetRecState.loading() = _Loading;
  const factory GetRecState.error(String error) = _Error;
  const factory GetRecState.success(List<RecModel> model) = _Success;
}

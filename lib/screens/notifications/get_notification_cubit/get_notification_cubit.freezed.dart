// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetNotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<NotificationHiveModel> model) success,
    required TResult Function() success2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<NotificationHiveModel> model)? success,
    TResult? Function()? success2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<NotificationHiveModel> model)? success,
    TResult Function()? success2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingNotification value) loading,
    required TResult Function(_ErrorNotification value) error,
    required TResult Function(_SuccessNotification value) success,
    required TResult Function(_SuccessNotification2 value) success2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingNotification value)? loading,
    TResult? Function(_ErrorNotification value)? error,
    TResult? Function(_SuccessNotification value)? success,
    TResult? Function(_SuccessNotification2 value)? success2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingNotification value)? loading,
    TResult Function(_ErrorNotification value)? error,
    TResult Function(_SuccessNotification value)? success,
    TResult Function(_SuccessNotification2 value)? success2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationStateCopyWith<$Res> {
  factory $GetNotificationStateCopyWith(GetNotificationState value,
          $Res Function(GetNotificationState) then) =
      _$GetNotificationStateCopyWithImpl<$Res, GetNotificationState>;
}

/// @nodoc
class _$GetNotificationStateCopyWithImpl<$Res,
        $Val extends GetNotificationState>
    implements $GetNotificationStateCopyWith<$Res> {
  _$GetNotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingNotificationImplCopyWith<$Res> {
  factory _$$LoadingNotificationImplCopyWith(_$LoadingNotificationImpl value,
          $Res Function(_$LoadingNotificationImpl) then) =
      __$$LoadingNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNotificationImplCopyWithImpl<$Res>
    extends _$GetNotificationStateCopyWithImpl<$Res, _$LoadingNotificationImpl>
    implements _$$LoadingNotificationImplCopyWith<$Res> {
  __$$LoadingNotificationImplCopyWithImpl(_$LoadingNotificationImpl _value,
      $Res Function(_$LoadingNotificationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingNotificationImpl implements _LoadingNotification {
  const _$LoadingNotificationImpl();

  @override
  String toString() {
    return 'GetNotificationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<NotificationHiveModel> model) success,
    required TResult Function() success2,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<NotificationHiveModel> model)? success,
    TResult? Function()? success2,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<NotificationHiveModel> model)? success,
    TResult Function()? success2,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingNotification value) loading,
    required TResult Function(_ErrorNotification value) error,
    required TResult Function(_SuccessNotification value) success,
    required TResult Function(_SuccessNotification2 value) success2,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingNotification value)? loading,
    TResult? Function(_ErrorNotification value)? error,
    TResult? Function(_SuccessNotification value)? success,
    TResult? Function(_SuccessNotification2 value)? success2,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingNotification value)? loading,
    TResult Function(_ErrorNotification value)? error,
    TResult Function(_SuccessNotification value)? success,
    TResult Function(_SuccessNotification2 value)? success2,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingNotification implements GetNotificationState {
  const factory _LoadingNotification() = _$LoadingNotificationImpl;
}

/// @nodoc
abstract class _$$ErrorNotificationImplCopyWith<$Res> {
  factory _$$ErrorNotificationImplCopyWith(_$ErrorNotificationImpl value,
          $Res Function(_$ErrorNotificationImpl) then) =
      __$$ErrorNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorNotificationImplCopyWithImpl<$Res>
    extends _$GetNotificationStateCopyWithImpl<$Res, _$ErrorNotificationImpl>
    implements _$$ErrorNotificationImplCopyWith<$Res> {
  __$$ErrorNotificationImplCopyWithImpl(_$ErrorNotificationImpl _value,
      $Res Function(_$ErrorNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorNotificationImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorNotificationImpl implements _ErrorNotification {
  const _$ErrorNotificationImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GetNotificationState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorNotificationImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorNotificationImplCopyWith<_$ErrorNotificationImpl> get copyWith =>
      __$$ErrorNotificationImplCopyWithImpl<_$ErrorNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<NotificationHiveModel> model) success,
    required TResult Function() success2,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<NotificationHiveModel> model)? success,
    TResult? Function()? success2,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<NotificationHiveModel> model)? success,
    TResult Function()? success2,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingNotification value) loading,
    required TResult Function(_ErrorNotification value) error,
    required TResult Function(_SuccessNotification value) success,
    required TResult Function(_SuccessNotification2 value) success2,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingNotification value)? loading,
    TResult? Function(_ErrorNotification value)? error,
    TResult? Function(_SuccessNotification value)? success,
    TResult? Function(_SuccessNotification2 value)? success2,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingNotification value)? loading,
    TResult Function(_ErrorNotification value)? error,
    TResult Function(_SuccessNotification value)? success,
    TResult Function(_SuccessNotification2 value)? success2,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorNotification implements GetNotificationState {
  const factory _ErrorNotification(final String error) =
      _$ErrorNotificationImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorNotificationImplCopyWith<_$ErrorNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessNotificationImplCopyWith<$Res> {
  factory _$$SuccessNotificationImplCopyWith(_$SuccessNotificationImpl value,
          $Res Function(_$SuccessNotificationImpl) then) =
      __$$SuccessNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationHiveModel> model});
}

/// @nodoc
class __$$SuccessNotificationImplCopyWithImpl<$Res>
    extends _$GetNotificationStateCopyWithImpl<$Res, _$SuccessNotificationImpl>
    implements _$$SuccessNotificationImplCopyWith<$Res> {
  __$$SuccessNotificationImplCopyWithImpl(_$SuccessNotificationImpl _value,
      $Res Function(_$SuccessNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$SuccessNotificationImpl(
      null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<NotificationHiveModel>,
    ));
  }
}

/// @nodoc

class _$SuccessNotificationImpl implements _SuccessNotification {
  const _$SuccessNotificationImpl(final List<NotificationHiveModel> model)
      : _model = model;

  final List<NotificationHiveModel> _model;
  @override
  List<NotificationHiveModel> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'GetNotificationState.success(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessNotificationImpl &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessNotificationImplCopyWith<_$SuccessNotificationImpl> get copyWith =>
      __$$SuccessNotificationImplCopyWithImpl<_$SuccessNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<NotificationHiveModel> model) success,
    required TResult Function() success2,
  }) {
    return success(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<NotificationHiveModel> model)? success,
    TResult? Function()? success2,
  }) {
    return success?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<NotificationHiveModel> model)? success,
    TResult Function()? success2,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingNotification value) loading,
    required TResult Function(_ErrorNotification value) error,
    required TResult Function(_SuccessNotification value) success,
    required TResult Function(_SuccessNotification2 value) success2,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingNotification value)? loading,
    TResult? Function(_ErrorNotification value)? error,
    TResult? Function(_SuccessNotification value)? success,
    TResult? Function(_SuccessNotification2 value)? success2,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingNotification value)? loading,
    TResult Function(_ErrorNotification value)? error,
    TResult Function(_SuccessNotification value)? success,
    TResult Function(_SuccessNotification2 value)? success2,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessNotification implements GetNotificationState {
  const factory _SuccessNotification(final List<NotificationHiveModel> model) =
      _$SuccessNotificationImpl;

  List<NotificationHiveModel> get model;
  @JsonKey(ignore: true)
  _$$SuccessNotificationImplCopyWith<_$SuccessNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessNotification2ImplCopyWith<$Res> {
  factory _$$SuccessNotification2ImplCopyWith(_$SuccessNotification2Impl value,
          $Res Function(_$SuccessNotification2Impl) then) =
      __$$SuccessNotification2ImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessNotification2ImplCopyWithImpl<$Res>
    extends _$GetNotificationStateCopyWithImpl<$Res, _$SuccessNotification2Impl>
    implements _$$SuccessNotification2ImplCopyWith<$Res> {
  __$$SuccessNotification2ImplCopyWithImpl(_$SuccessNotification2Impl _value,
      $Res Function(_$SuccessNotification2Impl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessNotification2Impl implements _SuccessNotification2 {
  const _$SuccessNotification2Impl();

  @override
  String toString() {
    return 'GetNotificationState.success2()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessNotification2Impl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(List<NotificationHiveModel> model) success,
    required TResult Function() success2,
  }) {
    return success2();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(List<NotificationHiveModel> model)? success,
    TResult? Function()? success2,
  }) {
    return success2?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(List<NotificationHiveModel> model)? success,
    TResult Function()? success2,
    required TResult orElse(),
  }) {
    if (success2 != null) {
      return success2();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingNotification value) loading,
    required TResult Function(_ErrorNotification value) error,
    required TResult Function(_SuccessNotification value) success,
    required TResult Function(_SuccessNotification2 value) success2,
  }) {
    return success2(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingNotification value)? loading,
    TResult? Function(_ErrorNotification value)? error,
    TResult? Function(_SuccessNotification value)? success,
    TResult? Function(_SuccessNotification2 value)? success2,
  }) {
    return success2?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingNotification value)? loading,
    TResult Function(_ErrorNotification value)? error,
    TResult Function(_SuccessNotification value)? success,
    TResult Function(_SuccessNotification2 value)? success2,
    required TResult orElse(),
  }) {
    if (success2 != null) {
      return success2(this);
    }
    return orElse();
  }
}

abstract class _SuccessNotification2 implements GetNotificationState {
  const factory _SuccessNotification2() = _$SuccessNotification2Impl;
}

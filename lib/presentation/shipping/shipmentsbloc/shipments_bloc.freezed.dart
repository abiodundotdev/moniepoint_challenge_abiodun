// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShipmentsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<ShipmentModel> data) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<ShipmentModel> data)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<ShipmentModel> data)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShipmentsLoadingState value) loading,
    required TResult Function(ShipmentsErrorState value) error,
    required TResult Function(ShipmentsCompletedState value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShipmentsLoadingState value)? loading,
    TResult? Function(ShipmentsErrorState value)? error,
    TResult? Function(ShipmentsCompletedState value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShipmentsLoadingState value)? loading,
    TResult Function(ShipmentsErrorState value)? error,
    TResult Function(ShipmentsCompletedState value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentsStateCopyWith<$Res> {
  factory $ShipmentsStateCopyWith(
          ShipmentsState value, $Res Function(ShipmentsState) then) =
      _$ShipmentsStateCopyWithImpl<$Res, ShipmentsState>;
}

/// @nodoc
class _$ShipmentsStateCopyWithImpl<$Res, $Val extends ShipmentsState>
    implements $ShipmentsStateCopyWith<$Res> {
  _$ShipmentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShipmentsLoadingStateCopyWith<$Res> {
  factory _$$ShipmentsLoadingStateCopyWith(_$ShipmentsLoadingState value,
          $Res Function(_$ShipmentsLoadingState) then) =
      __$$ShipmentsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShipmentsLoadingStateCopyWithImpl<$Res>
    extends _$ShipmentsStateCopyWithImpl<$Res, _$ShipmentsLoadingState>
    implements _$$ShipmentsLoadingStateCopyWith<$Res> {
  __$$ShipmentsLoadingStateCopyWithImpl(_$ShipmentsLoadingState _value,
      $Res Function(_$ShipmentsLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShipmentsLoadingState implements ShipmentsLoadingState {
  const _$ShipmentsLoadingState();

  @override
  String toString() {
    return 'ShipmentsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShipmentsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<ShipmentModel> data) completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<ShipmentModel> data)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<ShipmentModel> data)? completed,
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
    required TResult Function(ShipmentsLoadingState value) loading,
    required TResult Function(ShipmentsErrorState value) error,
    required TResult Function(ShipmentsCompletedState value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShipmentsLoadingState value)? loading,
    TResult? Function(ShipmentsErrorState value)? error,
    TResult? Function(ShipmentsCompletedState value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShipmentsLoadingState value)? loading,
    TResult Function(ShipmentsErrorState value)? error,
    TResult Function(ShipmentsCompletedState value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShipmentsLoadingState implements ShipmentsState {
  const factory ShipmentsLoadingState() = _$ShipmentsLoadingState;
}

/// @nodoc
abstract class _$$ShipmentsErrorStateCopyWith<$Res> {
  factory _$$ShipmentsErrorStateCopyWith(_$ShipmentsErrorState value,
          $Res Function(_$ShipmentsErrorState) then) =
      __$$ShipmentsErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ShipmentsErrorStateCopyWithImpl<$Res>
    extends _$ShipmentsStateCopyWithImpl<$Res, _$ShipmentsErrorState>
    implements _$$ShipmentsErrorStateCopyWith<$Res> {
  __$$ShipmentsErrorStateCopyWithImpl(
      _$ShipmentsErrorState _value, $Res Function(_$ShipmentsErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ShipmentsErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShipmentsErrorState implements ShipmentsErrorState {
  const _$ShipmentsErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ShipmentsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentsErrorStateCopyWith<_$ShipmentsErrorState> get copyWith =>
      __$$ShipmentsErrorStateCopyWithImpl<_$ShipmentsErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<ShipmentModel> data) completed,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<ShipmentModel> data)? completed,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<ShipmentModel> data)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShipmentsLoadingState value) loading,
    required TResult Function(ShipmentsErrorState value) error,
    required TResult Function(ShipmentsCompletedState value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShipmentsLoadingState value)? loading,
    TResult? Function(ShipmentsErrorState value)? error,
    TResult? Function(ShipmentsCompletedState value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShipmentsLoadingState value)? loading,
    TResult Function(ShipmentsErrorState value)? error,
    TResult Function(ShipmentsCompletedState value)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShipmentsErrorState implements ShipmentsState {
  const factory ShipmentsErrorState(final String message) =
      _$ShipmentsErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$ShipmentsErrorStateCopyWith<_$ShipmentsErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShipmentsCompletedStateCopyWith<$Res> {
  factory _$$ShipmentsCompletedStateCopyWith(_$ShipmentsCompletedState value,
          $Res Function(_$ShipmentsCompletedState) then) =
      __$$ShipmentsCompletedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ShipmentModel> data});
}

/// @nodoc
class __$$ShipmentsCompletedStateCopyWithImpl<$Res>
    extends _$ShipmentsStateCopyWithImpl<$Res, _$ShipmentsCompletedState>
    implements _$$ShipmentsCompletedStateCopyWith<$Res> {
  __$$ShipmentsCompletedStateCopyWithImpl(_$ShipmentsCompletedState _value,
      $Res Function(_$ShipmentsCompletedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ShipmentsCompletedState(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShipmentModel>,
    ));
  }
}

/// @nodoc

class _$ShipmentsCompletedState implements ShipmentsCompletedState {
  const _$ShipmentsCompletedState(final List<ShipmentModel> data)
      : _data = data;

  final List<ShipmentModel> _data;
  @override
  List<ShipmentModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ShipmentsState.completed(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentsCompletedState &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentsCompletedStateCopyWith<_$ShipmentsCompletedState> get copyWith =>
      __$$ShipmentsCompletedStateCopyWithImpl<_$ShipmentsCompletedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<ShipmentModel> data) completed,
  }) {
    return completed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<ShipmentModel> data)? completed,
  }) {
    return completed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<ShipmentModel> data)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShipmentsLoadingState value) loading,
    required TResult Function(ShipmentsErrorState value) error,
    required TResult Function(ShipmentsCompletedState value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShipmentsLoadingState value)? loading,
    TResult? Function(ShipmentsErrorState value)? error,
    TResult? Function(ShipmentsCompletedState value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShipmentsLoadingState value)? loading,
    TResult Function(ShipmentsErrorState value)? error,
    TResult Function(ShipmentsCompletedState value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class ShipmentsCompletedState implements ShipmentsState {
  const factory ShipmentsCompletedState(final List<ShipmentModel> data) =
      _$ShipmentsCompletedState;

  List<ShipmentModel> get data;
  @JsonKey(ignore: true)
  _$$ShipmentsCompletedStateCopyWith<_$ShipmentsCompletedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShipmentsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchShipmentsEvent value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchShipmentsEvent value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchShipmentsEvent value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentsEventCopyWith<$Res> {
  factory $ShipmentsEventCopyWith(
          ShipmentsEvent value, $Res Function(ShipmentsEvent) then) =
      _$ShipmentsEventCopyWithImpl<$Res, ShipmentsEvent>;
}

/// @nodoc
class _$ShipmentsEventCopyWithImpl<$Res, $Val extends ShipmentsEvent>
    implements $ShipmentsEventCopyWith<$Res> {
  _$ShipmentsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchShipmentsEventCopyWith<$Res> {
  factory _$$FetchShipmentsEventCopyWith(_$FetchShipmentsEvent value,
          $Res Function(_$FetchShipmentsEvent) then) =
      __$$FetchShipmentsEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchShipmentsEventCopyWithImpl<$Res>
    extends _$ShipmentsEventCopyWithImpl<$Res, _$FetchShipmentsEvent>
    implements _$$FetchShipmentsEventCopyWith<$Res> {
  __$$FetchShipmentsEventCopyWithImpl(
      _$FetchShipmentsEvent _value, $Res Function(_$FetchShipmentsEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchShipmentsEvent implements FetchShipmentsEvent {
  const _$FetchShipmentsEvent();

  @override
  String toString() {
    return 'ShipmentsEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchShipmentsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchShipmentsEvent value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchShipmentsEvent value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchShipmentsEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchShipmentsEvent implements ShipmentsEvent {
  const factory FetchShipmentsEvent() = _$FetchShipmentsEvent;
}

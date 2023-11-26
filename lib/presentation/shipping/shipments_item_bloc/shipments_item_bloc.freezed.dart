// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipments_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShipmentsItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<ShipmentItemModel> data) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<ShipmentItemModel> data)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<ShipmentItemModel> data)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShipmentsItemLoadingState value) loading,
    required TResult Function(ShipmentsItemErrorState value) error,
    required TResult Function(ShipmentsItemCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShipmentsItemLoadingState value)? loading,
    TResult? Function(ShipmentsItemErrorState value)? error,
    TResult? Function(ShipmentsItemCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShipmentsItemLoadingState value)? loading,
    TResult Function(ShipmentsItemErrorState value)? error,
    TResult Function(ShipmentsItemCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentsItemStateCopyWith<$Res> {
  factory $ShipmentsItemStateCopyWith(
          ShipmentsItemState value, $Res Function(ShipmentsItemState) then) =
      _$ShipmentsItemStateCopyWithImpl<$Res, ShipmentsItemState>;
}

/// @nodoc
class _$ShipmentsItemStateCopyWithImpl<$Res, $Val extends ShipmentsItemState>
    implements $ShipmentsItemStateCopyWith<$Res> {
  _$ShipmentsItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShipmentsItemLoadingStateCopyWith<$Res> {
  factory _$$ShipmentsItemLoadingStateCopyWith(
          _$ShipmentsItemLoadingState value,
          $Res Function(_$ShipmentsItemLoadingState) then) =
      __$$ShipmentsItemLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShipmentsItemLoadingStateCopyWithImpl<$Res>
    extends _$ShipmentsItemStateCopyWithImpl<$Res, _$ShipmentsItemLoadingState>
    implements _$$ShipmentsItemLoadingStateCopyWith<$Res> {
  __$$ShipmentsItemLoadingStateCopyWithImpl(_$ShipmentsItemLoadingState _value,
      $Res Function(_$ShipmentsItemLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShipmentsItemLoadingState implements ShipmentsItemLoadingState {
  const _$ShipmentsItemLoadingState();

  @override
  String toString() {
    return 'ShipmentsItemState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentsItemLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<ShipmentItemModel> data) completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<ShipmentItemModel> data)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<ShipmentItemModel> data)? completed,
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
    required TResult Function(ShipmentsItemLoadingState value) loading,
    required TResult Function(ShipmentsItemErrorState value) error,
    required TResult Function(ShipmentsItemCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShipmentsItemLoadingState value)? loading,
    TResult? Function(ShipmentsItemErrorState value)? error,
    TResult? Function(ShipmentsItemCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShipmentsItemLoadingState value)? loading,
    TResult Function(ShipmentsItemErrorState value)? error,
    TResult Function(ShipmentsItemCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShipmentsItemLoadingState implements ShipmentsItemState {
  const factory ShipmentsItemLoadingState() = _$ShipmentsItemLoadingState;
}

/// @nodoc
abstract class _$$ShipmentsItemErrorStateCopyWith<$Res> {
  factory _$$ShipmentsItemErrorStateCopyWith(_$ShipmentsItemErrorState value,
          $Res Function(_$ShipmentsItemErrorState) then) =
      __$$ShipmentsItemErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ShipmentsItemErrorStateCopyWithImpl<$Res>
    extends _$ShipmentsItemStateCopyWithImpl<$Res, _$ShipmentsItemErrorState>
    implements _$$ShipmentsItemErrorStateCopyWith<$Res> {
  __$$ShipmentsItemErrorStateCopyWithImpl(_$ShipmentsItemErrorState _value,
      $Res Function(_$ShipmentsItemErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ShipmentsItemErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShipmentsItemErrorState implements ShipmentsItemErrorState {
  const _$ShipmentsItemErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ShipmentsItemState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentsItemErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentsItemErrorStateCopyWith<_$ShipmentsItemErrorState> get copyWith =>
      __$$ShipmentsItemErrorStateCopyWithImpl<_$ShipmentsItemErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<ShipmentItemModel> data) completed,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<ShipmentItemModel> data)? completed,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<ShipmentItemModel> data)? completed,
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
    required TResult Function(ShipmentsItemLoadingState value) loading,
    required TResult Function(ShipmentsItemErrorState value) error,
    required TResult Function(ShipmentsItemCompleted value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShipmentsItemLoadingState value)? loading,
    TResult? Function(ShipmentsItemErrorState value)? error,
    TResult? Function(ShipmentsItemCompleted value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShipmentsItemLoadingState value)? loading,
    TResult Function(ShipmentsItemErrorState value)? error,
    TResult Function(ShipmentsItemCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShipmentsItemErrorState implements ShipmentsItemState {
  const factory ShipmentsItemErrorState(final String message) =
      _$ShipmentsItemErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$ShipmentsItemErrorStateCopyWith<_$ShipmentsItemErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShipmentsItemCompletedCopyWith<$Res> {
  factory _$$ShipmentsItemCompletedCopyWith(_$ShipmentsItemCompleted value,
          $Res Function(_$ShipmentsItemCompleted) then) =
      __$$ShipmentsItemCompletedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ShipmentItemModel> data});
}

/// @nodoc
class __$$ShipmentsItemCompletedCopyWithImpl<$Res>
    extends _$ShipmentsItemStateCopyWithImpl<$Res, _$ShipmentsItemCompleted>
    implements _$$ShipmentsItemCompletedCopyWith<$Res> {
  __$$ShipmentsItemCompletedCopyWithImpl(_$ShipmentsItemCompleted _value,
      $Res Function(_$ShipmentsItemCompleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ShipmentsItemCompleted(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShipmentItemModel>,
    ));
  }
}

/// @nodoc

class _$ShipmentsItemCompleted implements ShipmentsItemCompleted {
  const _$ShipmentsItemCompleted(final List<ShipmentItemModel> data)
      : _data = data;

  final List<ShipmentItemModel> _data;
  @override
  List<ShipmentItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ShipmentsItemState.completed(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentsItemCompleted &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentsItemCompletedCopyWith<_$ShipmentsItemCompleted> get copyWith =>
      __$$ShipmentsItemCompletedCopyWithImpl<_$ShipmentsItemCompleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<ShipmentItemModel> data) completed,
  }) {
    return completed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<ShipmentItemModel> data)? completed,
  }) {
    return completed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<ShipmentItemModel> data)? completed,
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
    required TResult Function(ShipmentsItemLoadingState value) loading,
    required TResult Function(ShipmentsItemErrorState value) error,
    required TResult Function(ShipmentsItemCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShipmentsItemLoadingState value)? loading,
    TResult? Function(ShipmentsItemErrorState value)? error,
    TResult? Function(ShipmentsItemCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShipmentsItemLoadingState value)? loading,
    TResult Function(ShipmentsItemErrorState value)? error,
    TResult Function(ShipmentsItemCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class ShipmentsItemCompleted implements ShipmentsItemState {
  const factory ShipmentsItemCompleted(final List<ShipmentItemModel> data) =
      _$ShipmentsItemCompleted;

  List<ShipmentItemModel> get data;
  @JsonKey(ignore: true)
  _$$ShipmentsItemCompletedCopyWith<_$ShipmentsItemCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShipmentsItemEvent {
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
    required TResult Function(FetchShipmentsItemEvent value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchShipmentsItemEvent value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchShipmentsItemEvent value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentsItemEventCopyWith<$Res> {
  factory $ShipmentsItemEventCopyWith(
          ShipmentsItemEvent value, $Res Function(ShipmentsItemEvent) then) =
      _$ShipmentsItemEventCopyWithImpl<$Res, ShipmentsItemEvent>;
}

/// @nodoc
class _$ShipmentsItemEventCopyWithImpl<$Res, $Val extends ShipmentsItemEvent>
    implements $ShipmentsItemEventCopyWith<$Res> {
  _$ShipmentsItemEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchShipmentsItemEventCopyWith<$Res> {
  factory _$$FetchShipmentsItemEventCopyWith(_$FetchShipmentsItemEvent value,
          $Res Function(_$FetchShipmentsItemEvent) then) =
      __$$FetchShipmentsItemEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchShipmentsItemEventCopyWithImpl<$Res>
    extends _$ShipmentsItemEventCopyWithImpl<$Res, _$FetchShipmentsItemEvent>
    implements _$$FetchShipmentsItemEventCopyWith<$Res> {
  __$$FetchShipmentsItemEventCopyWithImpl(_$FetchShipmentsItemEvent _value,
      $Res Function(_$FetchShipmentsItemEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchShipmentsItemEvent implements FetchShipmentsItemEvent {
  const _$FetchShipmentsItemEvent();

  @override
  String toString() {
    return 'ShipmentsItemEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchShipmentsItemEvent);
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
    required TResult Function(FetchShipmentsItemEvent value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchShipmentsItemEvent value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchShipmentsItemEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchShipmentsItemEvent implements ShipmentsItemEvent {
  const factory FetchShipmentsItemEvent() = _$FetchShipmentsItemEvent;
}

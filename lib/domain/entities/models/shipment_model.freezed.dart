// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShipmentModel _$ShipmentModelFromJson(Map<String, dynamic> json) {
  return _ShipmentModel.fromJson(json);
}

/// @nodoc
mixin _$ShipmentModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tracking_id')
  String? get trackingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShipmentModelCopyWith<ShipmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentModelCopyWith<$Res> {
  factory $ShipmentModelCopyWith(
          ShipmentModel value, $Res Function(ShipmentModel) then) =
      _$ShipmentModelCopyWithImpl<$Res, ShipmentModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'tracking_id') String? trackingId,
      @JsonKey(name: 'delivery_date') DateTime? deliveryDate,
      String? address,
      String? status,
      int? amount});
}

/// @nodoc
class _$ShipmentModelCopyWithImpl<$Res, $Val extends ShipmentModel>
    implements $ShipmentModelCopyWith<$Res> {
  _$ShipmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? trackingId = freezed,
    Object? deliveryDate = freezed,
    Object? address = freezed,
    Object? status = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShipmentModelCopyWith<$Res>
    implements $ShipmentModelCopyWith<$Res> {
  factory _$$_ShipmentModelCopyWith(
          _$_ShipmentModel value, $Res Function(_$_ShipmentModel) then) =
      __$$_ShipmentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'tracking_id') String? trackingId,
      @JsonKey(name: 'delivery_date') DateTime? deliveryDate,
      String? address,
      String? status,
      int? amount});
}

/// @nodoc
class __$$_ShipmentModelCopyWithImpl<$Res>
    extends _$ShipmentModelCopyWithImpl<$Res, _$_ShipmentModel>
    implements _$$_ShipmentModelCopyWith<$Res> {
  __$$_ShipmentModelCopyWithImpl(
      _$_ShipmentModel _value, $Res Function(_$_ShipmentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? trackingId = freezed,
    Object? deliveryDate = freezed,
    Object? address = freezed,
    Object? status = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$_ShipmentModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShipmentModel extends _ShipmentModel {
  _$_ShipmentModel(
      {this.id,
      @JsonKey(name: 'tracking_id') this.trackingId,
      @JsonKey(name: 'delivery_date') this.deliveryDate,
      this.address,
      this.status,
      this.amount})
      : super._();

  factory _$_ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShipmentModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'tracking_id')
  final String? trackingId;
  @override
  @JsonKey(name: 'delivery_date')
  final DateTime? deliveryDate;
  @override
  final String? address;
  @override
  final String? status;
  @override
  final int? amount;

  @override
  String toString() {
    return 'ShipmentModel(id: $id, trackingId: $trackingId, deliveryDate: $deliveryDate, address: $address, status: $status, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShipmentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trackingId, trackingId) ||
                other.trackingId == trackingId) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, trackingId, deliveryDate, address, status, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShipmentModelCopyWith<_$_ShipmentModel> get copyWith =>
      __$$_ShipmentModelCopyWithImpl<_$_ShipmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShipmentModelToJson(
      this,
    );
  }
}

abstract class _ShipmentModel extends ShipmentModel {
  factory _ShipmentModel(
      {final int? id,
      @JsonKey(name: 'tracking_id') final String? trackingId,
      @JsonKey(name: 'delivery_date') final DateTime? deliveryDate,
      final String? address,
      final String? status,
      final int? amount}) = _$_ShipmentModel;
  _ShipmentModel._() : super._();

  factory _ShipmentModel.fromJson(Map<String, dynamic> json) =
      _$_ShipmentModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'tracking_id')
  String? get trackingId;
  @override
  @JsonKey(name: 'delivery_date')
  DateTime? get deliveryDate;
  @override
  String? get address;
  @override
  String? get status;
  @override
  int? get amount;
  @override
  @JsonKey(ignore: true)
  _$$_ShipmentModelCopyWith<_$_ShipmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

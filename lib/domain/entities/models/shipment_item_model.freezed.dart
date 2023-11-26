// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShipmentItemModel _$ShipmentItemModelFromJson(Map<String, dynamic> json) {
  return _ShipmentItemModel.fromJson(json);
}

/// @nodoc
mixin _$ShipmentItemModel {
  String? get package => throw _privateConstructorUsedError;
  String? get trackingId => throw _privateConstructorUsedError;
  String? get senderLocation => throw _privateConstructorUsedError;
  String? get receiverLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShipmentItemModelCopyWith<ShipmentItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentItemModelCopyWith<$Res> {
  factory $ShipmentItemModelCopyWith(
          ShipmentItemModel value, $Res Function(ShipmentItemModel) then) =
      _$ShipmentItemModelCopyWithImpl<$Res, ShipmentItemModel>;
  @useResult
  $Res call(
      {String? package,
      String? trackingId,
      String? senderLocation,
      String? receiverLocation});
}

/// @nodoc
class _$ShipmentItemModelCopyWithImpl<$Res, $Val extends ShipmentItemModel>
    implements $ShipmentItemModelCopyWith<$Res> {
  _$ShipmentItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? package = freezed,
    Object? trackingId = freezed,
    Object? senderLocation = freezed,
    Object? receiverLocation = freezed,
  }) {
    return _then(_value.copyWith(
      package: freezed == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLocation: freezed == senderLocation
          ? _value.senderLocation
          : senderLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverLocation: freezed == receiverLocation
          ? _value.receiverLocation
          : receiverLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShipmentItemModelCopyWith<$Res>
    implements $ShipmentItemModelCopyWith<$Res> {
  factory _$$_ShipmentItemModelCopyWith(_$_ShipmentItemModel value,
          $Res Function(_$_ShipmentItemModel) then) =
      __$$_ShipmentItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? package,
      String? trackingId,
      String? senderLocation,
      String? receiverLocation});
}

/// @nodoc
class __$$_ShipmentItemModelCopyWithImpl<$Res>
    extends _$ShipmentItemModelCopyWithImpl<$Res, _$_ShipmentItemModel>
    implements _$$_ShipmentItemModelCopyWith<$Res> {
  __$$_ShipmentItemModelCopyWithImpl(
      _$_ShipmentItemModel _value, $Res Function(_$_ShipmentItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? package = freezed,
    Object? trackingId = freezed,
    Object? senderLocation = freezed,
    Object? receiverLocation = freezed,
  }) {
    return _then(_$_ShipmentItemModel(
      package: freezed == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLocation: freezed == senderLocation
          ? _value.senderLocation
          : senderLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverLocation: freezed == receiverLocation
          ? _value.receiverLocation
          : receiverLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShipmentItemModel implements _ShipmentItemModel {
  _$_ShipmentItemModel(
      {this.package,
      this.trackingId,
      this.senderLocation,
      this.receiverLocation});

  factory _$_ShipmentItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShipmentItemModelFromJson(json);

  @override
  final String? package;
  @override
  final String? trackingId;
  @override
  final String? senderLocation;
  @override
  final String? receiverLocation;

  @override
  String toString() {
    return 'ShipmentItemModel(package: $package, trackingId: $trackingId, senderLocation: $senderLocation, receiverLocation: $receiverLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShipmentItemModel &&
            (identical(other.package, package) || other.package == package) &&
            (identical(other.trackingId, trackingId) ||
                other.trackingId == trackingId) &&
            (identical(other.senderLocation, senderLocation) ||
                other.senderLocation == senderLocation) &&
            (identical(other.receiverLocation, receiverLocation) ||
                other.receiverLocation == receiverLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, package, trackingId, senderLocation, receiverLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShipmentItemModelCopyWith<_$_ShipmentItemModel> get copyWith =>
      __$$_ShipmentItemModelCopyWithImpl<_$_ShipmentItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShipmentItemModelToJson(
      this,
    );
  }
}

abstract class _ShipmentItemModel implements ShipmentItemModel {
  factory _ShipmentItemModel(
      {final String? package,
      final String? trackingId,
      final String? senderLocation,
      final String? receiverLocation}) = _$_ShipmentItemModel;

  factory _ShipmentItemModel.fromJson(Map<String, dynamic> json) =
      _$_ShipmentItemModel.fromJson;

  @override
  String? get package;
  @override
  String? get trackingId;
  @override
  String? get senderLocation;
  @override
  String? get receiverLocation;
  @override
  @JsonKey(ignore: true)
  _$$_ShipmentItemModelCopyWith<_$_ShipmentItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

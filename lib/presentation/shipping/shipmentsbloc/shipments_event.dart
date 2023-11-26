part of 'shipments_bloc.dart';

@freezed
class ShipmentsEvent with _$ShipmentsEvent {
  const factory ShipmentsEvent.fetch() = FetchShipmentsEvent;
}

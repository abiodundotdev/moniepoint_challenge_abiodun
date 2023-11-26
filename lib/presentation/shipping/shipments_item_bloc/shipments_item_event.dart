part of 'shipments_item_bloc.dart';

@freezed
class ShipmentsItemEvent with _$ShipmentsItemEvent {
  const factory ShipmentsItemEvent.fetch() = FetchShipmentsItemEvent;
}

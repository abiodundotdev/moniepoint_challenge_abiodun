part of 'shipments_bloc.dart';

@freezed
class ShipmentsState with _$ShipmentsState {
  const factory ShipmentsState.loading() = ShipmentsLoadingState;
  const factory ShipmentsState.error(String message) = ShipmentsErrorState;
  const factory ShipmentsState.completed(ShipmentList data) =
      ShipmentsCompletedState;
}

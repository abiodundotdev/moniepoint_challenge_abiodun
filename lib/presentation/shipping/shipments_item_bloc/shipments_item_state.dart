part of 'shipments_item_bloc.dart';

@freezed
class ShipmentsItemState with _$ShipmentsItemState {
  const factory ShipmentsItemState.loading() = ShipmentsItemLoadingState;
  const factory ShipmentsItemState.error(String message) =
      ShipmentsItemErrorState;
  const factory ShipmentsItemState.completed(ShipmentItemList data) =
      ShipmentsItemCompleted;
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/domain/entities/aliases/models.dart';

part 'shipments_item_state.dart';
part 'shipments_item_event.dart';
part 'shipments_item_bloc.freezed.dart';

class ShipmentsItemStateProvider
    extends Bloc<ShipmentsItemEvent, ShipmentsItemState> with ShippingUsecases {
  ShipmentsItemStateProvider() : super(const ShipmentsItemState.loading());
}

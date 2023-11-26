import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/presentation/presentation.dart';
import 'package:moniepoint/presentation/shipping/shipmentsbloc/shipments_bloc.dart';
import 'package:moniepoint/service_container.dart';

class ShipmentHistoryPage extends StatefulWidget {
  const ShipmentHistoryPage({super.key});

  @override
  State<ShipmentHistoryPage> createState() => _ShipmentHistoryPageState();
}

class _ShipmentHistoryPageState extends State<ShipmentHistoryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  final GlobalKey<AnimatedListState> animationListKey =
      GlobalKey<AnimatedListState>();

  List<ShipmentModel> shipmentData = [];

  final duration = SC.get.sessionStorage.appAnimationDuration.value;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ShipmentStatus.values.length, vsync: this);
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final state = BlocProvider.of<ShipmentsStateProvider>(context).state;
      if (state is ShipmentsCompletedState) {
        final data = state.data;
        _addItemsToAnimatedList(data);
      }
    });
  }

  void _addItemsToAnimatedList(ShipmentList _shipments) async {
    final ls = animationListKey.currentState!;
    if (shipmentData.isNotEmpty) {
      _removeItemsFromAnimatedList(ls);
    }
    for (var i = 0; i < _shipments.length; i++) {
      shipmentData.add(_shipments[i]);
      ls.insertItem(
        shipmentData.length - 1,
      );
      await Future.delayed(
        Duration(milliseconds: duration.inMilliseconds ~/ 4),
      );
    }
    //To update count in tab bar so item count can update
    setState(() {});
  }

  void _removeItemsFromAnimatedList(AnimatedListState ls) {
    for (int i = shipmentData.length - 1; i >= 0; i--) {
      shipmentData.removeAt(i);
      ls.removeItem(i, (context, animation) {
        return const SizedBox();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    const shipmentStatuses = ShipmentStatus.values;
    return AppScaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        key: AppWidgetKeys.appBar,
        title: "Shipment history",
        bottom: TabBar(
          key: AppWidgetKeys.scrollable,
          labelColor: Colors.white,
          indicatorColor: AppColors.secondary,
          indicatorWeight: 4.0,
          isScrollable: true,
          controller: _tabController,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          onTap: (index) {
            if (index == 0) {
              _addItemsToAnimatedList(shipmentData);
              return;
            }
            final status = _deriveStatus(index);
            final filtered = shipmentData
                .where((shipment) => shipment.statusToEnum == status)
                .toList();
            _addItemsToAnimatedList(filtered);
          },
          tabs: List.generate(
            shipmentStatuses.length,
            (index) => AnimatedBuilder(
              animation: _tabController,
              builder: (context, _) {
                bool isActive = index == _tabController.index;
                return Tab(
                  child: Row(
                    children: [
                      Text(shipmentStatuses[index].description),
                      Gap(8.0.w),
                      Container(
                        child: Text("${_deriveCount(index)}"),
                        padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        decoration: ShapeDecoration(
                          color:
                              isActive ? AppColors.secondary : Colors.white24,
                          shape: const StadiumBorder(),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: ShipmentsStateBuilder(
          builder: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20.0),
                Text(
                  "Shipments",
                  style: textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.adaptiveDark,
                  ),
                ),
                Gap(10.0.h),
                AnimatedList(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  key: animationListKey,
                  itemBuilder: (context, index, animation) {
                    return SlideTransition(
                      position: animation.drive(Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      )),
                      child: _ShipmentDetailsCard(
                        shipment: shipmentData[index],
                      ),
                    );
                  },
                ),
                Gap(50.0.h),
              ],
            );
          },
        ),
      ),
    );
  }

  ShipingStatus _deriveStatus(int index) {
    switch (index) {
      case 2:
        return ShipingStatus.inProgress;
      case 1:
        return ShipingStatus.loading;
      case 3:
        return ShipingStatus.pending;
      default:
        return ShipingStatus.inProgress;
    }
  }

  int _deriveCount(int index) {
    switch (index) {
      case 2:
        return shipmentData
            .where(
                (element) => element.statusToEnum == ShipingStatus.inProgress)
            .length;
      case 1:
        return shipmentData
            .where((element) => element.statusToEnum == ShipingStatus.loading)
            .length;
      case 3:
        return shipmentData
            .where((element) => element.statusToEnum == ShipingStatus.pending)
            .length;
      default:
        return shipmentData.length;
    }
  }
}

class _ShipmentDetailsCard extends StatelessWidget {
  final ShipmentModel shipment;
  const _ShipmentDetailsCard({required this.shipment});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 10.0.h),
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0).w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Container(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: AppColors.grey.shade100,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 4.0.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    shipment.statusToEnum.icon,
                    color: shipment.statusToEnum.color.withOpacity(.8),
                  ),
                  Gap(5.0.w),
                  Expanded(
                    child: Text(
                      shipment.status ?? "N/A",
                      maxLines: 1,
                      style: textTheme.bodyMedium!.copyWith(
                        fontSize: 12.0,
                        color: shipment.statusToEnum.color.withOpacity(.8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Gap(5.0.h),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Arriving today!",
                      style: textTheme.titleLarge!.copyWith(
                        fontSize: 17.0,
                        color: AppColors.dark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(3.0.h),
                    Text(
                      "Your delivery, #${shipment.trackingId} from atlanta, is arriving today!",
                      style:
                          textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image(image: AppImages.box),
              )
            ],
          ),
          Gap(5.0.h),
          Row(
            children: [
              Text(
                "${Money(shipment.amount ?? 0.0).formatted} USD",
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(8.0.w),
              CircleAvatar(
                radius: 2.5,
                backgroundColor: AppColors.grey.shade400,
              ),
              Gap(8.0.w),
              Text(
                DateFormat.yMMMd().format(
                  shipment.deliveryDate ?? DateTime.now(),
                ),
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

enum ShipmentStatus {
  all("All"),
  completed("Completed"),
  inProgress("In progress"),
  pendingOrder("Pending order"),
  cancelled("Cancelled");

  final String description;
  const ShipmentStatus(this.description);
}

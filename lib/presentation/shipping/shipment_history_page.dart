import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/presentation.dart';
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

  final List<String> shipmentData = [];

  final duration = SC.get.sessionStorage.appAnimationDuration.value;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ShipmentStatus.values.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addItemsToAnimatedList();
    });
    _scrollController = ScrollController()..addListener(_addItemOnScroll);
  }

  void _addItemOnScroll() async {
    final ls = animationListKey.currentState!;
    await Future.delayed(const Duration(seconds: 1));
    shipmentData.add("3");
    ls.insertItem(
      shipmentData.length - 1,
    );
  }

  void _addItemsToAnimatedList() async {
    final ls = animationListKey.currentState!;
    _removeItemsFromAnimatedList();
    for (var i = 0; i < 4; i++) {
      shipmentData.add("$i");
      ls.insertItem(
        shipmentData.length - 1,
      );
      await Future.delayed(
        Duration(milliseconds: duration.inMilliseconds ~/ 4),
      );
    }
  }

  void _removeItemsFromAnimatedList() {
    final ls = animationListKey.currentState!;
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
            _addItemsToAnimatedList();
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
                        child: Text("${index + 3}"),
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
        child: Column(
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
              initialItemCount: shipmentData.length,
              shrinkWrap: true,
              key: animationListKey,
              itemBuilder: (context, index, animation) {
                return SlideTransition(
                  position: animation.drive(Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  )),
                  child: _ShipmentDetailsCard(
                    status: index.isEven
                        ? ShipingStatus.inProgress
                        : ShipingStatus.pending,
                  ),
                );
              },
            ),
            Gap(50.0.h),
          ],
        ),
      ),
    );
  }
}

class _ShipmentDetailsCard extends StatelessWidget {
  final ShipingStatus status;
  const _ShipmentDetailsCard({required this.status});

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
                    status.icon,
                    color: status.color.withOpacity(.8),
                  ),
                  Gap(5.0.w),
                  Expanded(
                    child: Text(
                      status.fullName,
                      maxLines: 1,
                      style: textTheme.bodyMedium!.copyWith(
                        fontSize: 12.0,
                        color: status.color.withOpacity(.8),
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
                      "Your delivery, #NEJ20089122231 from atlanta, is arriving today!",
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
                "${Money(5000).formatted} USD",
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
                "Sep 20,2023",
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

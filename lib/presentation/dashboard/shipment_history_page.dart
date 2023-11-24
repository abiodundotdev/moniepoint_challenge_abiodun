import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/widget/app_scaffold.dart';
import 'package:moniepoint/presentation/widget/custom_app_bar.dart';

class ShipmentHistoryPage extends StatefulWidget {
  const ShipmentHistoryPage({super.key});

  @override
  State<ShipmentHistoryPage> createState() => _ShipmentHistoryPageState();
}

class _ShipmentHistoryPageState extends State<ShipmentHistoryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<AnimatedListState> animationListKey =
      GlobalKey<AnimatedListState>();

  final List<String> shipmentData = [];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ShipmentStatus.values.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addItemsToAnimatedList();
    });
  }

  void _addItemsToAnimatedList() async {
    final ls = animationListKey.currentState!;
    for (var i = 0; i < 10; i++) {
      shipmentData.add("$i");
      ls.insertItem(
        shipmentData.length - 1,
        duration: const Duration(milliseconds: 100),
      );
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    const shipmentStatuses = ShipmentStatus.values;

    return AppScaffold(
      appBar: CustomAppBar(
        title: "Shipment history",
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: AppColors.secondary,
          indicatorWeight: 4.0,
          isScrollable: true,
          controller: _tabController,
          onTap: (index) {},
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
                }),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20.0),
            Text(
              "Shipments",
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.dark,
              ),
            ),
            Gap(13.0.h),
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
                  child: const _ShipmentDetailsCard(),
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
  const _ShipmentDetailsCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final inputTheme = context.theme;
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
          Container(
            constraints: BoxConstraints(maxWidth: 130.0.w),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: Colors.grey.shade200,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 12.0.w,
              vertical: 6.0.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cached,
                  color: AppColors.green.shade500,
                ),
                Gap(10.0.w),
                Expanded(
                  child: Text(
                    "in-progress",
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.green.shade500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
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
                Money(5000).formatted,
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(8.0.w),
              CircleAvatar(
                radius: 3,
                backgroundColor: AppColors.grey.shade500,
              ),
              Gap(8.0.w),
              Text(
                "Sep 20,2023",
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
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

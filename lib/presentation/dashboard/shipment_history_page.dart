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
          tabs: List.generate(
            shipmentStatuses.length,
            (index) => Tab(
              text: shipmentStatuses[index].description,
            ),
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
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            Gap(15.0.h),
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
            )
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
    return Container(
      margin: EdgeInsets.only(bottom: 10.0.h),
      padding: const EdgeInsets.all(15.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActionChip(
            backgroundColor: AppColors.grey.shade100,
            label: Text(
              "in-progress",
              style: TextStyle(
                color: AppColors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
            avatar: Icon(
              Icons.refresh,
              color: AppColors.green,
            ),
          ),
          Gap(10.0.h),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Arriving today!",
                      style: textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    Gap(3.0.h),
                    Text(
                      "Your delivery, #NEJ20089934122231 from atlanta, is arriving today!",
                      style:
                          textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              Gap(20.0.w),
              const Expanded(
                child: CircleAvatar(
                  radius: 30,
                ),
              )
            ],
          ),
          Gap(10.0.h),
          Row(
            children: [
              Text(
                "1400 USD",
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gap(8.0.w),
              CircleAvatar(
                radius: 3,
                backgroundColor: AppColors.grey,
              ),
              Gap(8.0.w),
              Text(
                "Sep 20,2023",
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
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

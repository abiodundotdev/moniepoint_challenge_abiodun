import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/widget/app_scaffold.dart';
import 'package:moniepoint/presentation/widget/custom_app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> animationListKey =
      GlobalKey<AnimatedListState>();
  final List<ShipmentDataModel> shipmentData = AppFakeData.shipmentData;
  List<ShipmentDataModel> animatedShipmentData = [];
  late TextEditingController _searchFieldController;

  @override
  void initState() {
    super.initState();
    _searchFieldController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addItemsToAnimatedList(shipmentData);
    });
  }

  void _addItemsToAnimatedList(List<ShipmentDataModel> _shipmentData) async {
    final ls = animationListKey.currentState!;
    for (var i = 0; i < _shipmentData.length; i++) {
      animatedShipmentData.add(_shipmentData[i]);
      ls.insertItem(
        animatedShipmentData.length - 1,
      );
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        child: TextFormField(
          controller: _searchFieldController,
          onChanged: (val) {
            final searchResult = shipmentData
                .where((element) =>
                    element.package.contains(val) ||
                    element.trackingId.contains(val))
                .toList();
            animatedShipmentData = [];
            _addItemsToAnimatedList(searchResult);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: ValueListenableBuilder(
                valueListenable: _searchFieldController,
                builder: (_, __, ___) {
                  return AnimatedList(
                    physics: const BouncingScrollPhysics(),
                    initialItemCount: animatedShipmentData.length,
                    shrinkWrap: true,
                    key: animationListKey,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset.zero,
                          ),
                        ),
                        child: _ShipmentDetailsCard(
                          shipmentData: animatedShipmentData[index],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ShipmentDetailsCard extends StatelessWidget {
  final ShipmentDataModel shipmentData;
  const _ShipmentDetailsCard({required this.shipmentData});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return AppListTile(
      leading: const CircleAvatar(
        radius: 20.0,
        child: Icon(Icons.bolt),
      ),
      title: Text(
        shipmentData.package,
        style: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: DefaultTextStyle(
        style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400),
        child: Row(
          children: [
            Text("${shipmentData.trackingId} "),
            CircleAvatar(
              radius: (DefaultTextStyle.of(context).style.fontSize ?? 0) / 4,
              backgroundColor: AppColors.grey,
            ),
            Text("  ${shipmentData.senderLocation} "),
            Icon(
              Icons.arrow_forward,
              size: DefaultTextStyle.of(context).style.fontSize,
            ),
            Text(" ${shipmentData.receiverLocation}"),
          ],
        ),
      ),
    );
  }
}

class AppListTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget leading;

  const AppListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: leading,
                flex: 1,
              ),
              Gap(5.0.w),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    Gap(5.0.h),
                    subtitle,
                  ],
                ),
              )
            ],
          ),
          Gap(6.0.h),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

class ShipmentDataModel {
  final String package;
  final String trackingId;
  final String receiverLocation;
  final String senderLocation;

  ShipmentDataModel(
      {required this.package,
      required this.trackingId,
      required this.receiverLocation,
      required this.senderLocation});
}

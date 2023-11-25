import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/presentation.dart';
import 'package:moniepoint/service_container.dart';

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

  final animationDuration = SC.get.sessionStorage.appAnimationDuration.value;

  @override
  void initState() {
    super.initState();
    _searchFieldController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addItemsToAnimatedList(shipmentData);
    });
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  void _addItemsToAnimatedList(List<ShipmentDataModel> _shipmentData) async {
    final ls = animationListKey.currentState!;
    _removeItemsFromAnimatedList();
    for (var i = 0; i < _shipmentData.length; i++) {
      animatedShipmentData.add(_shipmentData[i]);
      ls.insertItem(
        animatedShipmentData.length - 1,
      );
      await Future.delayed(
        animationDuration.inMilliseconds > 100
            ? const Duration(milliseconds: 100)
            : animationDuration,
      );
    }
  }

  void _removeItemsFromAnimatedList() {
    final ls = animationListKey.currentState!;
    for (var i = 0; i < animatedShipmentData.length; i++) {
      animatedShipmentData.removeAt(i);
      ls.removeItem(i, (context, animation) {
        return const SizedBox();
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        titleSpacing: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0, 15.0, 0).w,
          child: Hero(
            tag: "searchHero",
            child: Material(
              type: MaterialType.transparency,
              child: TextFormField(
                controller: _searchFieldController,
                decoration: InputDecoration(
                  hintText: "Enter the reciept number ... ",
                  prefixIcon: Icon(Icons.search, size: 22.0.w),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: CircleAvatar(
                      backgroundColor: AppColors.secondary,
                      child: Transform.rotate(
                        angle: Angle(90).toRadians,
                        child: Icon(
                          AppIcons.flip,
                          size: 22.0.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
                onChanged: (val) {
                  final searchResult = shipmentData
                      .where((element) =>
                          element.package
                              .toLowerCase()
                              .contains(val.toLowerCase()) ||
                          element.trackingId
                              .toLowerCase()
                              .contains(val.toLowerCase()))
                      .toList();
                  _addItemsToAnimatedList(searchResult);
                },
              ),
            ),
          ),
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
        child: Icon(Icons.inbox),
      ),
      title: Text(
        shipmentData.package,
        style: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
      subtitle: DefaultTextStyle(
        style: textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
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
              color: AppColors.dark,
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

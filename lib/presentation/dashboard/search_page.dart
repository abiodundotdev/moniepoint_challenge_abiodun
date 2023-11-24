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
  late TabController _tabController;

  final GlobalKey<AnimatedListState> animationListKey =
      GlobalKey<AnimatedListState>();

  final List<String> shipmentData = [];

  @override
  void initState() {
    super.initState();

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

    return AppScaffold(
      appBar: CustomAppBar(
        child: TextFormField(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20.0),
            AnimatedList(
              physics: const BouncingScrollPhysics(),
              initialItemCount: shipmentData.length,
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
    return AppListTile(
      leading: const CircleAvatar(
        radius: 20.0,
        child: Icon(Icons.bolt),
      ),
      title: Text(
        "Mackook pro M2",
        style: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: DefaultTextStyle(
        style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400),
        child: Row(
          children: [
            const Text("3NE38388238823 "),
            CircleAvatar(
              radius: (DefaultTextStyle.of(context).style.fontSize ?? 0) / 4,
              backgroundColor: AppColors.grey,
            ),
            const Text("  Barcelona "),
            Icon(
              Icons.arrow_forward,
              size: DefaultTextStyle.of(context).style.fontSize,
            ),
            const Text(" Moroco"),
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
                    Gap(3.0.h),
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

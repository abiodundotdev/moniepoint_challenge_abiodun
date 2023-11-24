import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/widget/titled_card.dart';
import 'package:moniepoint/presentation/widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return AppScaffold(
        //   shouldAnimate: true,
        //      animationDuration: const Duration(milliseconds: 200),
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10.0.h),
              const _TrackingView(),
              Gap(10.0.h),
              TitledCard(
                title: "Available vehicles",
                content: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      6,
                      (index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10.0.w),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ocean Fright",
                                      style: textTheme.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "International",
                                      style: textTheme.bodySmall!.copyWith(
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class _TrackingView extends StatelessWidget {
  const _TrackingView();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return TitledCard(
      title: "Tracking",
      content: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shippment Number",
                      style:
                          textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                    ),
                    Gap(5.0.h),
                    Text(
                      "NEJ200002172772781872",
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 20.0,
                ),
              ],
            ),
            Gap(6.0.h),
            const Divider(
              thickness: 3,
            ),
            Row(
              children: [
                Expanded(
                  child: InfoTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.secondary.shade800,
                      child: const Icon(Icons.bolt),
                    ),
                    title: "Sender",
                    content: "Atlanta",
                  ),
                ),
                const Expanded(
                  child: InfoTile(
                    title: "Sender",
                    content: "2 day - 3 days",
                  ),
                )
              ],
            ),
            Gap(30.0.h),
            Row(
              children: [
                Expanded(
                  child: InfoTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.green.shade800,
                      child: const Icon(Icons.bolt),
                    ),
                    title: "Reciever",
                    content: "Chicago, 42",
                  ),
                ),
                const Expanded(
                  child: InfoTile(
                    title: "Sender",
                    content: "2 day - 3 days",
                  ),
                )
              ],
            ),
            Gap(6.0.h),
            const Divider(
              thickness: 3,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add shop"),
            )
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final Widget? child;
  final String? content;
  final Widget? leading;

  const InfoTile(
      {super.key, required this.title, this.content, this.leading, this.child});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return Row(
      children: [
        if (leading != null) ...[leading!, Gap(10.0.h)],
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodySmall!.copyWith(color: AppColors.grey),
            ),
            const Gap(5.0),
            content != null
                ? Text(
                    content ?? "N/A",
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : child!
          ],
        )
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Animation<double>? animation;
  const HomeAppBar({super.key, this.animation});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.green,
                    ),
                    Gap(20.0.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Location",
                              style: textTheme.bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              const TextSpan(
                                text: "Wethmier, illion ",
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                  )
                                ],
                              ),
                              style: textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
              Gap(10.0.h),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter the reciept number",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: ShapeDecoration(
                        color: AppColors.secondary,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.scale,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Gap(8.0.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50.0.h);
}

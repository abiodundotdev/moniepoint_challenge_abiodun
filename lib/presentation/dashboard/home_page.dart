import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/presentation.dart';
import 'package:moniepoint/service_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        shouldAnimate: true,
        animationDuration: SC.get.sessionStorage.appAnimationDuration.value,
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(15.0.h),
              const _TrackingView(),
              Gap(15.0.h),
              const _AvailableVehiclesView(),
              Gap(55.0.h),
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
          color: AppColors.white,
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
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shippment Number",
                        style: textTheme.bodySmall!.copyWith(
                          color: AppColors.grey.shade600,
                        ),
                      ),
                      Gap(5.0.h),
                      Text(
                        "NEJ200002172772781872",
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image(
                    image: AppImages.tractor,
                  ),
                ),
              ],
            ),
            Gap(6.0.h),
            const Divider(
              thickness: 2,
            ),
            Gap(5.0.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoTile(
                        leading: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: ShapeDecoration(
                            color: AppColors.secondary.withOpacity(.5),
                            shape: const CircleBorder(),
                          ),
                          child: Image(
                            image: AppImages.outgoing,
                            width: context.theme.iconTheme.size,
                            height: context.theme.iconTheme.size,
                          ),
                        ),
                        title: "Sender",
                        content: "Atlanta, 5234",
                      ),
                      Gap(30.0.h),
                      InfoTile(
                        leading: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: ShapeDecoration(
                            color: AppColors.green.withOpacity(.3),
                            shape: const CircleBorder(),
                          ),
                          child: Image(
                            image: AppImages.incoming,
                            width: context.theme.iconTheme.size,
                            height: context.theme.iconTheme.size,
                          ),
                        ),
                        title: "Reciever",
                        content: "Chicago, 6342",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoTile(
                        title: "Time",
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: AppColors.green,
                            ),
                            Gap(4.0.w),
                            Text(
                              "2 day - 3 days",
                              style: textTheme.bodyMedium!.copyWith(
                                color: AppColors.dark,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Gap(30.0.h),
                      const InfoTile(
                        title: "Status",
                        content: "Waiting to collect",
                      ),
                    ],
                  )
                ],
              ),
            ),
            Gap(6.0.h),
            const Divider(
              thickness: 3,
            ),
            Gap(6.0.h),
            InkResponse(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.secondary,
                  ),
                  Gap(5.0.h),
                  Text(
                    "Add Stop",
                    style: textTheme.labelLarge!.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AvailableVehiclesView extends StatefulWidget {
  const _AvailableVehiclesView();

  @override
  State<_AvailableVehiclesView> createState() => __AvailableVehiclesViewState();
}

class __AvailableVehiclesViewState extends State<_AvailableVehiclesView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final vehicles = [
      _VehicleData(
        type: "Ocean freight",
        category: "International",
        image: AppImages.cargo,
      ),
      _VehicleData(
        type: "Cargo freight",
        category: "Reliable",
        image: AppImages.truck,
      ),
      _VehicleData(
        type: "Air freight",
        category: "International",
        image: AppImages.plane,
      )
    ];
    return TitledCard(
      title: "Available vehicles",
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            vehicles.length,
            (index) {
              final width = MediaQuery.of(context).size.width;
              return Container(
                width: width / 2.7,
                height: 160.0.h,
                margin: EdgeInsets.only(right: 15.0.w),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vehicles[index].type,
                            style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: AppColors.dark,
                            ),
                          ),
                          Gap(2.0.h),
                          Text(
                            vehicles[index].category,
                            style: textTheme.bodySmall!.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    LayoutBuilder(builder: (context, cons) {
                      return Image(
                        width: cons.maxWidth,
                        image: vehicles[index].image,
                        fit: BoxFit.cover,
                      );
                    })
                  ],
                ),
              );
            },
          ),
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
                      fontWeight: FontWeight.w500,
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image(image: AppImages.profileImage),
                    ),
                    Gap(15.0.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                      child: Icon(
                                    AppIcons.nearMe,
                                    size: 18.0,
                                    color: AppColors.white.shade100,
                                  )),
                                  const TextSpan(text: "  Your Location"),
                                ],
                              ),
                              style: textTheme.bodyLarge!.copyWith(
                                color: AppColors.white.shade100,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: "Wethmier, illionois",
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      AppIcons.keyboardArrowDown,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              style: textTheme.bodyMedium!.copyWith(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.w,
                      backgroundColor: Colors.white,
                      child: Icon(
                        AppIcons.notification,
                        size: 25.0.sp,
                      ),
                    )
                  ],
                ),
              ),
              Gap(10.0.h),
              Expanded(
                child: Hero(
                  tag: "searchHero",
                  child: Material(
                    type: MaterialType.transparency,
                    child: TextFormField(
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
                      readOnly: true,
                      onTap: () => SC.get.navigator.dash.toSearchPage(),
                    ),
                  ),
                ),
              ),
              Gap(10.0.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 60.0.h);
}

class _VehicleData {
  final String type;
  final String category;
  final ImageProvider image;

  _VehicleData(
      {required this.type, required this.category, required this.image});
}

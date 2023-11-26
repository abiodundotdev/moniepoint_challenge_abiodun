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

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, RouteAware {
  late TabController _tabRoutesController;
  late List<_TabRouteView> _tabRouteViews;
  late AnimationController bottomAnimationController;
  late AnimationController avController;
  final navigator = SC.get.navigator;
  final animationDuration = SC.get.sessionStorage.appAnimationDuration.value;

  @override
  void didPopNext() async {
    await bottomAnimationController.reverse();
    await Future.delayed(const Duration(milliseconds: 200));
    _tabRoutesController.animateTo(
      0,
      duration: Duration(
        milliseconds: _tabRoutesController.index *
            (animationDuration.inMilliseconds - 100),
      ),
    );
    super.didPopNext();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });

    _tabRouteViews = <_TabRouteView>[
      _TabRouteView(
        icon: AppIcons.home,
        label: "Home",
        onTap: () {},
      ),
      _TabRouteView(
          icon: AppIcons.calculator,
          label: "Calculate",
          onTap: () => navigator.dash.toCalculate()),
      _TabRouteView(
          icon: AppIcons.history,
          label: "Shipment",
          onTap: () => navigator.dash.toShipmentHistory()),
      _TabRouteView(
        icon: AppIcons.person,
        label: "Profile",
        onTap: () => navigator.dash.toSearchPage(),
      ),
    ];

    _tabRoutesController = TabController(
      length: _tabRouteViews.length,
      vsync: this,
    );

    bottomAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration.inMilliseconds - 100),
    );

    avController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration.inMilliseconds ~/ 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    final systemPadding = MediaQuery.of(context).padding;
    return AppScaffold(
      animation:
          const AppScaffoldAnimation(appBar: true, body: true, bottom: true),
      animationDuration: SC.get.sessionStorage.appAnimationDuration.value,
      onAnimationEnd: (_) {
        avController.forward();
      },
      appBar: HomeAppBar(
        key: AppWidgetKeys.appBar,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15.0.h),
            _TrackingView(
              key: AppWidgetKeys.homeTrackingWidget,
            ),
            Gap(15.0.h),
            _AvailableVehiclesView(
              animationController: avController,
              key: AppWidgetKeys.homeAvailableVehiclesWidget,
            ),
            Gap(80.0.h),
          ],
        ),
      ),
      bottom: PreferredSize(
        key: AppWidgetKeys.bottomNavBar,
        preferredSize: Size.fromHeight(
          kBottomNavigationBarHeight + systemPadding.bottom,
        ),
        child: AnimatedBuilder(
            animation: bottomAnimationController,
            builder: (context, _) {
              return SlideTransition(
                position: bottomAnimationController.drive(Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0, 1),
                )),
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  decoration: BoxDecoration(
                    color:
                        context.theme.bottomNavigationBarTheme.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, -4),
                        blurRadius: 8,
                        color: const Color(0xFF000000).withOpacity(.05),
                      ),
                    ],
                  ),
                  child: AnimatedBuilder(
                    animation: _tabRoutesController,
                    builder: (context, _) {
                      return TabBar(
                        labelColor: AppColors.adaptivePrimary,
                        unselectedLabelColor: AppColors.grey,
                        controller: _tabRoutesController,
                        indicator: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppColors.adaptivePrimary,
                              width: 4.0.h,
                            ),
                          ),
                        ),
                        onTap: (index) async {
                          if (index != 0) {
                            await Future.delayed(
                                _tabRoutesController.animationDuration);
                            bottomAnimationController.forward();
                            await Future.delayed(
                                bottomAnimationController.duration!);
                            _tabRouteViews[index].onTap.call();
                          }
                        },
                        tabs: List.generate(
                          _tabRouteViews.length,
                          (index) => Tab(
                            text: _tabRouteViews[index].label,
                            iconMargin: const EdgeInsets.only(bottom: 1.0),
                            icon: Icon(
                              _tabRouteViews[index].icon,
                              color: _tabRoutesController.index == index
                                  ? AppColors.adaptivePrimary
                                  : AppColors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
      ),
      fab: PreferredSize(
        child: InkResponse(
          onTap: _handleFabTap,
          child: const CircleAvatar(
            child: Icon(
              Icons.bolt,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
        preferredSize: Size.square(55.0.w),
      ),
    );
  }

  void _handleFabTap() {
    final textTheme = context.theme.textTheme;
    final sessionStorage = SC.get.sessionStorage;
    final animationDurationController = sessionStorage.appAnimationDuration;
    final appThemeController = sessionStorage.appThemeMode;

    showModalBottomSheet(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Material(
          child: Container(
            constraints: BoxConstraints(maxHeight: 200.0.h),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ValueListenableBuilder(
              valueListenable: animationDurationController,
              builder: (context, _, __) {
                return Column(
                  children: [
                    const Gap(10.0),
                    Text(
                      "Slide to change animation duration",
                      style: textTheme.titleLarge!.copyWith(
                        fontSize: 16.0,
                        color: AppColors.adaptiveDark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(10.0),
                    Slider(
                      max: 10000,
                      min: 100,
                      value: animationDurationController.value.inMilliseconds
                          .toDouble(),
                      divisions: 100,
                      onChanged: (val) {
                        animationDurationController.value = Duration(
                          milliseconds: val.toInt(),
                        );
                      },
                    ),
                    const Gap(10.0),
                    Text(
                      "${animationDurationController.value.inMilliseconds} Milliseconds",
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.adaptiveDark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(10.0),
                    Divider(thickness: 2, color: AppColors.dark),
                    const Gap(10.0),
                    ValueListenableBuilder(
                      valueListenable: appThemeController,
                      builder: (context, _, __) {
                        return SwitchListTile.adaptive(
                          title: const Text("Switch from light to dark mode"),
                          value: appThemeController.value.isDark,
                          onChanged: (isDarkMode) {
                            if (!isDarkMode) {
                              appThemeController.value = ThemeMode.light;
                            } else {
                              appThemeController.value = ThemeMode.dark;
                            }
                          },
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _TrackingView extends StatelessWidget {
  const _TrackingView({super.key});

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
                          fontWeight: FontWeight.w700,
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
  final AnimationController animationController;

  const _AvailableVehiclesView({super.key, required this.animationController});

  @override
  State<_AvailableVehiclesView> createState() => __AvailableVehiclesViewState();
}

class __AvailableVehiclesViewState extends State<_AvailableVehiclesView>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
    const endOffset = Offset(1, 0);

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
                    SlideTransition(
                      position: widget.animationController.drive(
                        Tween(
                          begin: endOffset,
                          end: Offset.zero,
                        ),
                      ),
                      child: Padding(
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
                    ),
                    SlideTransition(
                      position: widget.animationController.drive(
                        Tween(
                          begin: endOffset,
                          end: Offset.zero,
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (context, cons) {
                          return Image(
                            width: cons.maxWidth,
                            image: vehicles[index].image,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
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
                        color: AppColors.dark,
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

class _TabRouteView {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  _TabRouteView({required this.label, required this.icon, required this.onTap});
}

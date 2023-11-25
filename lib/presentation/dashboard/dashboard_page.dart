import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/presentation.dart';

import 'dart:ui' as ui;

import 'package:moniepoint/service_container.dart';

class _TabRouteView {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  _TabRouteView({required this.label, required this.icon, required this.onTap});
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin, RouteAware {
  //final PageStorageBucket _pageStorageBucket = PageStorageBucket();
  late TabController _tabRoutesController;
  late List<_TabRouteView> _tabRouteViews;
  late AnimationController bottomAnimator;
  final navigator = SC.get.navigator;

  @override
  void didPopNext() {
    bottomAnimator.reverse();
    _tabRoutesController.animateTo(0);
    super.didPopNext();
  }

  @override
  void initState() {
    super.initState();
    //Listen to route to know when user navigates from dashboard to another screen
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });

    _tabRouteViews = <_TabRouteView>[
      _TabRouteView(
        icon: AppIcons.home,
        label: "Home",
        onTap: () {},
        // onTap: const HomePage(key: PageStorageKey("home")),
      ),
      _TabRouteView(
          icon: AppIcons.calculator,
          label: "Calculate",
          onTap: () => navigator.dash.toCalculate()
          //  page: const CalculatePage(key: PageStorageKey("calculate")),
          ),
      _TabRouteView(
          icon: AppIcons.history,
          label: "Shipment",
          onTap: () => navigator.dash.toShipmentHistory()
          //  page: const ShipmentHistoryPage(key: PageStorageKey("shippment")),
          ),
      _TabRouteView(
          icon: AppIcons.person,
          label: "Profile",
          onTap: () => navigator.dash.toSearchPage()
          // page: const SearchPage(key: PageStorageKey("profile")),
          ),
    ];
    _tabRoutesController = TabController(
      length: _tabRouteViews.length,
      vsync: this,
    );
    bottomAnimator = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _tabRoutesController.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final systemPadding = MediaQuery.of(context).padding;
    return AppScaffold(
      animation: const AppScaffoldAnimation(bottom: true),
      padding: EdgeInsets.zero,
      body: const HomePage(),
      bottom: PreferredSize(
        preferredSize:
            Size.fromHeight(kBottomNavigationBarHeight + systemPadding.bottom),
        child: AnimatedBuilder(
            animation: bottomAnimator,
            builder: (context, _) {
              return SlideTransition(
                position: bottomAnimator.drive(Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0, 2),
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
                            bottomAnimator.forward();
                            await Future.delayed(bottomAnimator.duration!);
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

  // PageStorage(
  //       bucket: _pageStorageBucket,
  //       child: TabBarView(
  //         physics: const NeverScrollableScrollPhysics(),
  //         controller: _tabRoutesController,
  //         children: List.generate(
  //             _tabRouteViews.length, (index) => _tabRouteViews[index].page),
  //       ),
  //     )

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
        return BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 2.0,
            sigmaY: 2.0,
          ),
          child: Material(
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
          ),
        );
      },
    );
  }
}

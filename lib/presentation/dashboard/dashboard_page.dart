import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/presentation.dart';

class _TabRouteView {
  final String label;
  final IconData icon;
  final Widget page;
  _TabRouteView({required this.label, required this.icon, required this.page});
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  final PageStorageBucket _pageStorageBucket = PageStorageBucket();
  late TabController _tabRoutesController;
  late List<_TabRouteView> _tabRouteViews;
  late AnimationController bottomAnimator;

  @override
  void initState() {
    super.initState();
    _tabRouteViews = <_TabRouteView>[
      _TabRouteView(
        icon: Icons.home_outlined,
        label: "Home",
        page: const HomePage(key: PageStorageKey("home")),
      ),
      _TabRouteView(
        icon: Icons.calculate_outlined,
        label: "Calculate",
        page: const CalculatePage(key: PageStorageKey("calculate")),
      ),
      _TabRouteView(
        icon: Icons.history_outlined,
        label: "Shipment",
        page: const ShipmentHistoryPage(key: PageStorageKey("shippment")),
      ),
      _TabRouteView(
        icon: Icons.person_outlined,
        label: "Profile",
        page: const SearchPage(key: PageStorageKey("profile")),
      ),
    ];

    _tabRoutesController = TabController(
      length: _tabRouteViews.length,
      vsync: this,
    );
    bottomAnimator = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    _tabRoutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      body: PageStorage(
        bucket: _pageStorageBucket,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabRoutesController,
          children: List.generate(
              _tabRouteViews.length, (index) => _tabRouteViews[index].page),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kBottomNavigationBarHeight + 32.0.h),
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          decoration: BoxDecoration(
            color: context.theme.bottomNavigationBarTheme.backgroundColor,
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
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.grey,
                controller: _tabRoutesController,
                indicator: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.primary,
                      width: 4.0.h,
                    ),
                  ),
                ),
                onTap: (index) {
                  if (index != 0) {
                    bottomAnimator.forward();
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
                          ? AppColors.primary
                          : AppColors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:moniepoint/core/core.dart';
import 'dart:ui' as ui;

import 'package:moniepoint/presentation/presentation.dart';

enum _LayoutSlot {
  body,
  appBar,
  background,
  bottom,
  fab,
}

enum SnackBarStatus {
  success,
  error,
  info;

  bool get isSuccess => this == SnackBarStatus.success;
}

//TODO: Assert when cleaning up
class AppScaffold extends StatefulWidget {
  const AppScaffold({
    Key? key,
    required this.body,
    this.backgroundColor,
    this.background,
    this.animation = const AppScaffoldAnimation(),
    this.animationDuration = const Duration(seconds: 1),
    this.appBar,
    this.padding,
    this.bottom,
    this.fab,
    this.animationController,
    this.onAnimationEnd,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;
  final Widget? background;
  final AppScaffoldAnimation animation;
  final EdgeInsets? padding;
  final PreferredSizeWidget? fab;
  final PreferredSizeWidget? bottom;
  final ValueSetter<Animation<double>>? onAnimationEnd;
  final Duration animationDuration;
  final AnimationController? animationController;

  static AppScaffoldState of(BuildContext context) {
    return context.findAncestorStateOfType<AppScaffoldState>()!;
  }

  static Future<void> showSnackBar(
    BuildContext context, {
    bool isDismissible = true,
    SnackBarStatus status = SnackBarStatus.success,
    required String message,
    VoidCallback? onClose,
  }) async {
    const settings = RouteSettings(name: "snackbar");
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      routeSettings: settings,
      builder: (context) {
        return BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 3.0,
            sigmaY: 3.0,
          ),
          child: Container(
            constraints: BoxConstraints(maxHeight: 250.0.h),
            padding: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: Column(
              children: [
                Gap(10.0.h),
                LottieBuilder.asset(
                  status.isSuccess ? AppLotties.success : AppLotties.error,
                  repeat: false,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topCenter,
                  width: 120.w,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                Gap(15.0.h),
                ContainedButton(
                  text: "Dismiss",
                  color: AppColors.secondary,
                  onPressed: onClose ?? () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> hideSnackBar(BuildContext context) async {
    Navigator.of(context).pop();
  }

  @override
  AppScaffoldState createState() => AppScaffoldState();
}

class AppScaffoldState extends State<AppScaffold>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController bottomContoller;

  AnimationController get effectiveAnimationController =>
      (widget.animationController ?? animationController);

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);

    bottomContoller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      final bool isFullScreen =
          parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
      if (mounted && widget.animation.shouldAnimate) {
        effectiveAnimationController.forward();
        effectiveAnimationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            if (!widget.onAnimationEnd.isNull) {
              widget.onAnimationEnd!(effectiveAnimationController);
            }
            if (!widget.bottom.isNull && widget.animation.bottom) {
              bottomContoller.forward();
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    bottomContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context);
    final systemPadding = queryData.padding;
    final bodyBottomPadding =
        (widget.bottom?.preferredSize.height ?? 0) + systemPadding.bottom;
    final appBarHeight = widget.appBar != null
        ? (widget.appBar!.preferredSize.height + systemPadding.top)
        : 0.0;
    final theme = context.theme;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return Material(
          color: theme.scaffoldBackgroundColor,
          child: CustomMultiChildLayout(
            delegate: _AppScaffoldDelegate(
                padding: widget.padding,
                viewInsets: queryData.viewInsets,
                fabSize: widget.fab?.preferredSize,
                bottomHeight: (widget.bottom?.preferredSize.height ?? 0)),
            children: <Widget>[
              if (!widget.appBar.isNull)
                LayoutId(
                  id: _LayoutSlot.appBar,
                  child: SlideTransition(
                    position: effectiveAnimationController.drive(
                      Tween(
                        begin: widget.animation.appBar
                            ? const Offset(0, -1)
                            : Offset.zero,
                        end: Offset.zero,
                      ),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: appBarHeight),
                      child: FlexibleSpaceBar.createSettings(
                        currentExtent: appBarHeight,
                        child: MediaQuery(
                          data: queryData.removePadding(removeBottom: true),
                          child: widget.appBar!,
                        ),
                      ),
                    ),
                  ),
                ),
              LayoutId(
                id: _LayoutSlot.body,
                child: SlideTransition(
                  position: effectiveAnimationController.drive(
                    Tween(
                      begin: widget.animation.body
                          ? const Offset(0, 1)
                          : Offset.zero,
                      end: Offset.zero,
                    ),
                  ),
                  child: MediaQuery(
                    data: queryData.removePadding(
                        removeTop: widget.appBar != null, removeBottom: true),
                    child: Padding(
                      padding: widget.padding ??
                          const EdgeInsets.fromLTRB(
                            15.0,
                            0,
                            15.0,
                            0,
                          ),
                      child: widget.body,
                    ),
                  ),
                ),
              ),
              if (!widget.bottom.isNull)
                LayoutId(
                  id: _LayoutSlot.bottom,
                  child: SlideTransition(
                    position: effectiveAnimationController.drive(
                      Tween(
                        begin: widget.animation.bottom
                            ? const Offset(0, 1)
                            : Offset.zero,
                        end: Offset.zero,
                      ),
                    ),
                    child: widget.bottom ?? const SizedBox(),
                  ),
                ),
              if (!widget.fab.isNull)
                LayoutId(
                  id: _LayoutSlot.fab,
                  child: ScaleTransition(
                    scale: effectiveAnimationController.drive(
                      Tween(
                        begin: widget.animation.bottom ? 0 : 1,
                        end: 1,
                      ),
                    ),
                    child: widget.fab ?? const SizedBox(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _AppScaffoldDelegate extends MultiChildLayoutDelegate {
  _AppScaffoldDelegate({
    this.fabSize,
    this.viewInsets,
    this.bottomHeight,
    this.padding,
  });

  final EdgeInsets? viewInsets;
  final double? bottomHeight;
  final Size? fabSize;
  final EdgeInsets? padding;

  @override
  void performLayout(Size size) {
    final _bottomHeight = bottomHeight ?? 0;
    final looseConstraints = BoxConstraints.loose(size);
    final fullWidthConstraints = looseConstraints.tighten(width: size.width);

    if (hasChild(_LayoutSlot.background)) {
      layoutChild(_LayoutSlot.background, fullWidthConstraints);
      positionChild(_LayoutSlot.background, Offset.zero);
    }

    double appBarHeight = 0.0;
    if (hasChild(_LayoutSlot.appBar)) {
      appBarHeight =
          layoutChild(_LayoutSlot.appBar, fullWidthConstraints).height;
      positionChild(
        _LayoutSlot.appBar,
        Offset.zero,
      );
    }

    final bodyConstraints = fullWidthConstraints.copyWith(
      maxHeight:
          fullWidthConstraints.maxHeight - appBarHeight - viewInsets!.bottom,
    );
    layoutChild(_LayoutSlot.body, bodyConstraints);
    positionChild(
      _LayoutSlot.body,
      Offset(0, appBarHeight),
    );

    if (hasChild(_LayoutSlot.bottom)) {
      layoutChild(_LayoutSlot.bottom,
          BoxConstraints.tight(Size(size.width, _bottomHeight)));
      positionChild(_LayoutSlot.bottom,
          Offset(0, looseConstraints.maxHeight - _bottomHeight));
    }

    if (hasChild(_LayoutSlot.fab)) {
      layoutChild(_LayoutSlot.fab,
          BoxConstraints.tight(Size(fabSize!.width, fabSize!.height)));

      positionChild(
        _LayoutSlot.fab,
        Offset(
          looseConstraints.maxWidth - fabSize!.width - (20.0.w),
          looseConstraints.maxHeight -
              (_bottomHeight + fabSize!.height + (20.h)),
        ),
      );
    }
  }

  @override
  bool shouldRelayout(_AppScaffoldDelegate oldDelegate) =>
      viewInsets != oldDelegate.viewInsets;
}

class AppScaffoldAnimation {
  final bool appBar;
  final bool body;
  final bool bottom;
  const AppScaffoldAnimation({
    this.appBar = false,
    this.body = false,
    this.bottom = false,
  });
  bool get shouldAnimate => appBar || body || bottom;
}

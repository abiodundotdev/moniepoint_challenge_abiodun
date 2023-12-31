import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/service_container.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.titleSpacing,
    this.automaticallyImplyLeading = true,
    this.title,
    this.child,
    this.systemOverlayStyle = SystemUiOverlayStyle.dark,
    this.leading,
    this.trailing,
    this.centerTitle = true,
    this.onPop,
    this.scrollUnderElevation,
    this.bottom,
    this.titleTextStyle,
    this.leadingWidth,
  })  : assert((() => !(title != null && child != null))(),
            'Only either title or child can be used'),
        super(key: key);

  final double? titleSpacing;
  final bool automaticallyImplyLeading;
  final String? title;
  final Widget? child;
  final bool centerTitle;
  final SystemUiOverlayStyle systemOverlayStyle;
  final Widget? leading;
  final Widget? trailing;
  final double? leadingWidth;
  final VoidCallback? onPop;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;
  final double? scrollUnderElevation;

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? leadingWidget = leading;
    if (leading == null && automaticallyImplyLeading) {
      leadingWidget = useCloseButton
          ? AppCloseButton(onPressed: onPop)
          : AppBackButton(onPressed: onPop);
    }

    return AppBar(
      titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leadingWidth: leadingWidth,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leading: AppBackButton(onPressed: onPop),
      centerTitle: centerTitle,
      systemOverlayStyle: systemOverlayStyle,
      title: _buildTitle(context),
      elevation: 0,
      scrolledUnderElevation: scrollUnderElevation,
      actions: <Widget>[if (trailing != null) trailing!],
      bottom: bottom,
    );
  }

  Widget? _buildTitle(BuildContext context) {
    if (child != null) {
      return child;
    }

    if (title != null) {
      return Text(
        title!,
        style: titleTextStyle ??
            Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
      );
    }

    return null;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({Key? key, this.color, this.onPressed})
      : super(key: key);

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: IconTheme.of(context).size!,
      icon: Icon(
        Icons.close,
        color: (color ?? AppColors.dark),
      ),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key, this.color, this.onPressed}) : super(key: key);

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: IconTheme.of(context).size!,
      icon: Icon(
        Platform.isIOS ? Icons.keyboard_arrow_left : Icons.arrow_back,
        size: 30.0,
      ),
      color: (color ?? AppColors.white),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => SC.get.navigator.dash.pop(),
    );
  }
}

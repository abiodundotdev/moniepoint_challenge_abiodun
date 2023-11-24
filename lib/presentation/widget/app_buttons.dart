import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';

abstract class _AppButton extends StatefulWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final MaterialColor color;
  final BoxDecoration? decoration;
  final Widget? icon;
  final Color textColor;
  final double? height;
  final double? width;
  const _AppButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.color,
    this.decoration,
    this.height,
    this.width,
    this.textColor = Colors.white,
    required this.isLoading,
    this.icon,
  });

  @override
  State<_AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<_AppButton> {
  double _buttonScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
      scale: _buttonScale,
      onEnd: () => buttonScale = 1.0,
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () async {
            buttonScale = .9;
            await Future.delayed(const Duration(milliseconds: 500));
            widget.onPressed?.call();
          },
          child: Ink(
            width: widget.width ?? double.maxFinite,
            height: widget.height ?? (Theme.of(context).buttonTheme.height),
            decoration: widget.decoration ??
                ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: widget.onPressed == null
                      ? widget.color.shade200
                      : widget.color,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[widget.icon!, Gap(5.0.w)],
                widget.isLoading
                    ? const CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white,
                      )
                    : Text(
                        widget.text,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: widget.textColor,
                              fontWeight: FontWeight.w600,
                              //fontSize: 12.0.sp,
                            ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  set buttonScale(double value) {
    setState(() {
      _buttonScale = value;
    });
  }
}

class ContainedButton extends _AppButton {
  ///Raised button with background color
  ContainedButton(
      {required super.text,
      MaterialColor? color,
      super.key,
      super.onPressed,
      super.decoration,
      super.isLoading = false,
      super.height,
      super.width})
      : super(
          color: color ?? AppColors.secondary,
        );

  ///Raised button with background color and an icon [Widget]
  ContainedButton.icon({
    required super.text,
    MaterialColor? color,
    super.key,
    required Widget super.icon,
    super.onPressed,
    super.height,
    super.isLoading = false,
    super.width,
    super.decoration,
  }) : super(
          color: color ?? AppColors.secondary,
        );
}

class GhostButton extends _AppButton {
  /// Outlined button with a colored border and white background color
  GhostButton({
    required super.text,
    MaterialColor? color,
    super.key,
    Color? textColor,
    super.height,
    super.onPressed,
    Color? outlineColor,
    super.width,
    BoxDecoration? decoration,
    super.isLoading = false,
  }) : super(
          color: color ?? AppColors.primary,
          decoration: decoration ??
              BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.0.w),
                border: Border.all(
                  color: outlineColor ?? Colors.red,
                ),
              ),
          textColor: textColor ?? AppColors.primary,
        );

  GhostButton.icon({
    required super.text,
    MaterialColor? color,
    super.key,
    super.height,
    super.width,
    super.onPressed,
    required Widget super.icon,
    Color? outlineColor,
    BoxDecoration? decoration,
    super.isLoading = false,
  }) : super(
          color: color ?? AppColors.primary,
          decoration: decoration ??
              BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.0.w),
                border: Border.all(
                  color: outlineColor ?? Colors.red,
                ),
              ),
          textColor: AppColors.primary,
        );
}

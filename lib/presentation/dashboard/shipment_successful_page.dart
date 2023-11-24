import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/presentation.dart';
import 'package:moniepoint/service_container.dart';

class ShipmentSuccessful extends StatefulWidget {
  const ShipmentSuccessful({super.key});

  @override
  State<ShipmentSuccessful> createState() => _ShipmentSuccessfulState();
}

class _ShipmentSuccessfulState extends State<ShipmentSuccessful>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late List<Animation<double>> _animationsList;

  @override
  void initState() {
    int animationLength = 4;
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animationsList = List.generate(
      animationLength,
      (index) => CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          index / animationLength,
          (index + 1) / animationLength,
          curve: Curves.easeIn,
        ),
      ),
    );
    if (mounted) {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return AppScaffold(
      padding: const EdgeInsets.all(25.0).w,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: _animationsList[0].drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ),
            ),
            child: Image(image: AppImages.logo),
          ),
          SlideTransition(
              position: _animationsList[1].drive(
                Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ),
              ),
              child: ScaleTransition(
                scale: _animationsList[1].drive(
                  Tween<double>(
                    begin: 0,
                    end: 1,
                  ),
                ),
                child: Image(image: AppImages.box),
              )),
          SlideTransition(
            position: _animationsList[2].drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Group(
                alignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Estimated Amount",
                    style: textTheme.titleLarge!.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                  Gap(8.0.h),
                  const Countup(
                    duration: Duration(seconds: 1),
                    to: 5000,
                  ),
                  Gap(8.0.h),
                  Text(
                    "This amount is estimated this will vary if you change your location or weight",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(20.0.h),
          SlideTransition(
            position: _animationsList[3].drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ),
            ),
            child: ContainedButton(
              text: "Back to home",
              onPressed: () => SC.get.navigator.dash.toDashboard(),
            ),
          )
        ],
      ),
    );
  }
}

class Countup extends StatefulWidget {
  final int to;
  final Duration? duration;
  const Countup({super.key, required this.to, this.duration});

  @override
  State<Countup> createState() => CountupState();
}

class CountupState extends State<Countup> {
  int currentCount = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _timer = Timer.periodic(
          Duration(
            microseconds: widget.to ~/ (widget.duration?.inMicroseconds ?? 100),
          ), (timer) {
        if (currentCount < widget.to) {
          setState(() {
            currentCount++;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final money = Money(currentCount);
    return Text.rich(
      TextSpan(text: money.formatted, children: [
        TextSpan(
            text: " ${money.currency}", style: const TextStyle(fontSize: 16.0)),
      ]),
      style: context.theme.textTheme.titleLarge!.copyWith(
        color: AppColors.green,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/service_container.dart';

import 'shipping/shipments_item_bloc/shipments_item_bloc.dart';
import 'shipping/shipmentsbloc/shipments_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController alignmentAnimation;
  late Animation sequantialAnimtion;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    sequantialAnimtion = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0, end: 0.8), weight: 60),
      TweenSequenceItem(tween: Tween(begin: 0.8, end: 1), weight: 20),
    ]).animate(animationController);
    alignmentAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        if (alignmentAnimation.isCompleted) {
          SC.get.navigator.dash.toHome();
        }
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Container(
              padding: const EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  image: DecorationImage(
                    image: AppImages.splashBg,
                    fit: BoxFit.cover,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: animationController.isCompleted ? 1 : 0,
                              curve: Curves.easeIn,
                              onEnd: () async {
                                // This is to fetch the data
                                ShipmentsStateProvider.fetch(context);
                                ShipmentsItemStateProvider.fetch(context);
                                alignmentAnimation.forward();
                              },
                              child: Text(
                                "MoveMate",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppFonts.kanit,
                                  color: AppColors.primary,
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            SlideTransition(
                              position: sequantialAnimtion.drive(
                                Tween(
                                    begin: const Offset(-2, 0),
                                    end: Offset.zero),
                              ),
                              child: LottieBuilder.asset(
                                AppLotties.van,
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.topCenter,
                                width: 105.w,
                                animate: !animationController.isCompleted,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment(0, .06 * alignmentAnimation.value),
                    child: Visibility(
                      visible: alignmentAnimation.value > .5,
                      child: const Text(
                        "Your movement partner ...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

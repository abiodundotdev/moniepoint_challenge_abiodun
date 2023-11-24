import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/widget/app_scaffold.dart';
import 'package:moniepoint/presentation/widget/custom_app_bar.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return AppScaffold(
      appBar: CustomAppBar(
        title: "Calculate",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20.0),
            Text(
              "Destination",
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            Gap(15.0.h),
            Container(
              margin: EdgeInsets.only(bottom: 10.0.h),
              padding: const EdgeInsets.all(15.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: inputDecoration(
                      "Sender location",
                      Icons.unarchive_outlined,
                    ),
                  ),
                  Gap(10.0.h),
                  TextFormField(
                    decoration: inputDecoration(
                      "Reciever location",
                      Icons.unarchive_outlined,
                    ),
                  ),
                  Gap(10.0.h),
                  TextFormField(
                    decoration: inputDecoration(
                      "Approx weight",
                      Icons.scale_outlined,
                    ),
                  ),
                  Gap(10.0.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            const Gap(6.0),
            Container(
              height: 22.0.h,
              color: AppColors.grey,
              width: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/widget/app_buttons.dart';
import 'package:moniepoint/presentation/widget/app_scaffold.dart';
import 'package:moniepoint/presentation/widget/custom_app_bar.dart';
import 'package:moniepoint/presentation/widget/grouped.dart';
import 'package:moniepoint/presentation/widget/titled_card.dart';
import 'package:moniepoint/service_container.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late List<Animation<double>> _animationsList;

  @override
  void initState() {
    int animationLength = 4;
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animationsList = List.generate(
      animationLength,
      (index) => Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          index / animationLength,
          (index + 1) / animationLength,
          curve: Curves.easeIn,
        ),
      )),
    );
    if (mounted) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final _titleStyle = textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 17.0,
    );
    return AppScaffold(
      appBar: CustomAppBar(
        title: "Calculate",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20.0),
            SlideTransition(
              position: _animationsList[0].drive(
                Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ),
              ),
              child: Group(
                children: [
                  Text(
                    "Destination",
                    style: _titleStyle,
                  ),
                  Gap(10.0.h),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0.h),
                    padding: const EdgeInsets.all(16.0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(10.0.h),
            SlideTransition(
              position: _animationsList[1].drive(
                Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ),
              ),
              child: Group(
                children: [
                  Text(
                    "Packaging",
                    style: _titleStyle,
                  ),
                  Gap(5.0.h),
                  TitledCard(
                    title: "What are you sending?",
                    titleColor: AppColors.grey,
                    content: TextFormField(
                      decoration: inputDecoration(
                        "Box",
                        Icons.add_box,
                      ).copyWith(
                        hintStyle: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        fillColor: Colors.white,
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(30.0.h),
            SlideTransition(
              position: _animationsList[2].drive(
                Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ),
              ),
              child: Group(
                children: [
                  Text(
                    "Categories",
                    style: _titleStyle,
                  ),
                  Gap(5.0.h),
                  TitledCard(
                    title: "What are you sending?",
                    titleColor: AppColors.grey,
                    content: CategoriesView(
                      animation: _animationsList[2],
                      onChanged: (category) {},
                    ),
                  ),
                ],
              ),
            ),
            Gap(30.0.h),
            SlideTransition(
              position: _animationsList[3].drive(
                Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ),
              ),
              child: ContainedButton(
                text: "Calculate",
                onPressed: () => SC.get.navigator.dash.toShipmentSuccessful(),
              ),
            ),
            Gap(60.0.h),
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

class CategoriesView extends StatefulWidget {
  final ValueSetter<String> onChanged;
  final Animation<double>? animation;

  const CategoriesView({super.key, required this.onChanged, this.animation});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final categories = [
    "Documents",
    "Glass",
    "Liquid",
    "Food",
    "Electronics",
    "Product",
    "Others"
  ];
  List<String> animationCategories = [];
  String _selectedCategory = "";
  final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addItemsToAnimatedList();
    });
  }

  void _addItemsToAnimatedList() async {
    final ls = _gridKey.currentState!;
    for (var i = 0; i < categories.length; i++) {
      animationCategories.add(categories[i]);
      ls.insertItem(
        animationCategories.length - 1,
      );
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return SizedBox(
      height: 80.0.h,
      child: AnimatedGrid(
        key: _gridKey,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10.0.h,
          crossAxisSpacing: 8.0.w,
          childAspectRatio: 2 / 1,
        ),
        physics: const NeverScrollableScrollPhysics(),
        initialItemCount: animationCategories.length,
        itemBuilder: (context, index, animation) {
          bool isSelected = animationCategories[index] == _selectedCategory;
          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(2, 0),
                end: Offset.zero,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = animationCategories[index];
                });
                widget.onChanged(_selectedCategory);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                decoration: ShapeDecoration(
                  color: isSelected ? AppColors.dark : AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColors.black.shade700,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Row(
                  children: [
                    if (isSelected) ...[
                      const Icon(
                        Icons.check,
                        size: 15.0,
                        color: Colors.white,
                      ),
                      const Gap(1.0)
                    ],
                    Expanded(
                      child: Text(
                        categories[index],
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium!.copyWith(
                          color: isSelected ? AppColors.white : AppColors.dark,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

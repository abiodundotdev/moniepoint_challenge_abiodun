import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/service_container.dart';

class AppTheme extends InheritedTheme {
  const AppTheme({super.key, required Widget child}) : super(child: child);

  static const Color hintColor = Color(0xFFAAAAAA);
  static const Color borderSideColor = Color(0x66D1D1D1);
  static Color borderSideErrorColor = Colors.red..shade900;
  static const Color textDarkColor = Color(0xFFFFFFFF);
  static const Color kTextLightColor = Color(0xFF000000);

  ThemeData light(ThemeData theme) {
    final textFieldBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(5.0),
    );
    return ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.white.shade500,
        primarySwatch: AppColors.primary,
        primaryColor: AppColors.primary,
        primaryIconTheme: theme.primaryIconTheme.copyWith(
          color: AppColors.primary,
        ),
        brightness: Brightness.light,
        textTheme: theme.textTheme
            .copyWith(
              labelLarge: theme.textTheme.labelLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            )
            .apply(
              bodyColor: AppColors.black,
              displayColor: AppColors.baseBlack,
              fontFamily: AppFonts.inter,
            ),
        iconTheme: theme.iconTheme.copyWith(size: 20, color: AppColors.dark),
        listTileTheme: theme.listTileTheme.copyWith(
          tileColor: const Color(0XFFBCBBC1).withOpacity(.20),
        ),
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: AppColors.primary,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14.0,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: AppColors.white),
        bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
          backgroundColor: Colors.white,
        ),
        canvasColor: Colors.white,
        shadowColor: Colors.grey.shade400,
        buttonTheme: theme.buttonTheme.copyWith(
          height: 50.0,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ),
          highlightColor: Colors.white10,
          splashColor: Colors.white10,
          shape: const RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.primary,
        ),
        dividerTheme: DividerThemeData(
          color: const Color(0XFFBCBBC1).withOpacity(.10),
        ),
        chipTheme: theme.chipTheme.copyWith(
          backgroundColor: AppColors.grey.shade200,
          iconTheme: IconThemeData(
            color: AppColors.green,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: textFieldBorder,
          focusedBorder: textFieldBorder.copyWith(
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          focusColor: AppColors.primary,
          suffixIconColor: const Color(0xFFC7C7C7),
          hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.grey.shade500,
          ),
          enabledBorder: textFieldBorder,
          errorBorder: textFieldBorder.copyWith(
            borderSide: BorderSide(color: borderSideErrorColor, width: 1.0),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.0.h,
            horizontal: 12.0.h,
          ),
          fillColor: AppColors.white.shade500,
          filled: true,
        ),
        textSelectionTheme: theme.textSelectionTheme.copyWith(
          cursorColor: AppColors.primary,
          selectionColor: AppColors.primary.shade300,
          selectionHandleColor: AppColors.primary.shade300,
        ),
        fontFamily: AppFonts.inter,
        hintColor: hintColor,
        disabledColor: hintColor,
        dividerColor: borderSideColor,
        tabBarTheme: theme.tabBarTheme.copyWith());
  }

  ThemeData dark(ThemeData theme) {
    final textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey),
      borderRadius: BorderRadius.circular(5.0),
    );

    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.dark,
      primarySwatch: AppColors.primary,
      primaryColor: AppColors.primary,
      brightness: Brightness.dark,
      primaryIconTheme: theme.primaryIconTheme.copyWith(
        color: AppColors.primary,
      ),
      textTheme: theme.textTheme
          .copyWith(
              labelLarge: theme.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
              bodyMedium: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.dark,
              ))
          .apply(
            bodyColor: textDarkColor,
            displayColor: textDarkColor,
            fontFamily: AppFonts.inter,
          ),
      iconTheme: theme.iconTheme.copyWith(size: 20, color: AppColors.dark),
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: AppColors.dark,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 14.0,
        ),
      ),
      listTileTheme: theme.listTileTheme.copyWith(
        tileColor: const Color(0XFFBCBBC1).withOpacity(.20),
      ),
      sliderTheme: theme.sliderTheme.copyWith(
        thumbColor: AppColors.white,
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        backgroundColor: AppColors.dark,
      ),
      canvasColor: AppColors.dark,
      shadowColor: Colors.grey.shade400,
      buttonTheme: theme.buttonTheme.copyWith(
        height: 50.0,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        highlightColor: Colors.white10,
        splashColor: Colors.white10,
        shape: const RoundedRectangleBorder(),
        textTheme: ButtonTextTheme.primary,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.dark),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: textFieldBorder,
        focusedBorder: textFieldBorder.copyWith(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
        ),
        focusColor: AppColors.primary,
        suffixIconColor: const Color(0xFFC7C7C7),
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
          color: AppColors.grey.shade500,
        ),
        enabledBorder: textFieldBorder,
        errorBorder: textFieldBorder.copyWith(
          borderSide: BorderSide(color: borderSideErrorColor, width: 1.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0.h,
          horizontal: 12.0.h,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      textSelectionTheme: theme.textSelectionTheme.copyWith(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary.shade300,
      ),
      fontFamily: AppFonts.inter,
      hintColor: hintColor,
      disabledColor: hintColor,
      dividerColor: borderSideColor,
    );
  }

  static Color get adaptiveDark {
    final theme = SC.get.sessionStorage.appThemeMode;
    return theme.value.isDark ? Colors.white : AppColors.dark;
  }

  static AppTheme? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }

  static AppTheme of(BuildContext context) {
    final AppTheme? result = maybeOf(context);
    assert(result != null, 'No AppTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return true;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AppTheme(
      child: child,
    );
  }
}

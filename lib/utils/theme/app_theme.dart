import 'package:flutter/material.dart';
import 'package:mighty_fin/utils/constants/colors.dart';
import '../constants/sizes.dart';

class AppTheme {

  ThemeData getLightTheme() {
    final sizes = AppValues();

    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: const ColorScheme.light(
        primary: primary,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: primary,
        indicatorColor: white,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? const TextStyle(
                  color: textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                )
              : const TextStyle(
                  color: textAmber,
                  fontSize: 12,
                ),
        ),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
        ?const IconThemeData(
                color: Colors.deepPurple,
              ):
              const IconThemeData(
                color: Colors.black,
              ),
        ),
      ),

      // appBarTheme: AppBarTheme(
      //     color: AppColors.lightScheme().primary,
      //     titleTextStyle: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20,
      //     )
      // )
      // appBarTheme: AppBarTheme(
      //   backgroundColor: chosenColor.light().primaryColor,
      //   foregroundColor: chosenColor.light().primaryColorLight,
      //   titleTextStyle: TextStyle(
      //     // fontFamily: fontFamilyName,
      //     fontSize: sizes.appBarText,
      //     color: chosenColor.whiteColor,
      //     fontWeight: FontWeight.w500,
      //   ),
      // ),
      // textTheme: TextTheme(
      //   bodyMedium: TextStyle(
      //     color: chosenColor.textColor,
      //     fontSize: sizes.normalText,
      //     // fontFamily: fontFamilyName,
      //   ),
      //   headlineLarge: TextStyle(
      //     color: chosenColor.textColor,
      //     fontSize: sizes.largeText,
      //     // fontFamily: fontFamilyName,
      //   ),
      // ),
      // filledButtonTheme: FilledButtonThemeData(
      //   style: ButtonStyle(
      //     backgroundColor:
      //     WidgetStateProperty.all<Color>(chosenColor.primaryColor),
      //     foregroundColor:
      //     WidgetStateProperty.all<Color>(chosenColor.whiteColor),
      //     textStyle: WidgetStateProperty.all<TextStyle>(
      //       TextStyle(
      //         fontSize: sizes.smallText,
      //         // fontFamily: fontFamilyName,
      //       ),
      //     ),
      //   ),
      // ),
      // switchTheme: SwitchThemeData(
      //   thumbColor: WidgetStateProperty.all<Color>(chosenColor.primaryColor),
      //   overlayColor:
      //   WidgetStateProperty.all<Color>(chosenColor.backgroundColor),
      //   trackColor:
      //   WidgetStateProperty.all<Color>(chosenColor.backgroundColor),
      //   trackOutlineColor:
      //   WidgetStateProperty.all<Color>(chosenColor.backgroundColor),
      // ),
    );
  }

  ThemeData getDarkTheme() {
    final sizes = AppValues();

    return ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme:const ColorScheme.dark(
        primary: primary,
      ),
    );
  }
}

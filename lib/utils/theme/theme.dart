// import "package:flutter/material.dart";
//
// class MaterialTheme {
//   final TextTheme textTheme;
//
//   const MaterialTheme(this.textTheme);
//
//   static ColorScheme lightScheme() {
//     return const ColorScheme(
//       brightness: Brightness.light,
//       primary: Color(4286074754),
//       surfaceTint: Color(4286074754),
//       onPrimary: Color(4294967295),
//       primaryContainer: Color(4294694911),
//       onPrimaryContainer: Color(4281272891),
//       secondary: Color(4285159788),
//       onSecondary: Color(4294967295),
//       secondaryContainer: Color(4294106099),
//       onSecondaryContainer: Color(4280555303),
//       tertiary: Color(4286730830),
//       onTertiary: Color(4294967295),
//       tertiaryContainer: Color(4294957782),
//       onTertiaryContainer: Color(4281536783),
//       error: Color(4290386458),
//       onError: Color(4294967295),
//       errorContainer: Color(4294957782),
//       onErrorContainer: Color(4282449922),
//       surface: Color(4294965243),
//       onSurface: Color(4280228383),
//       onSurfaceVariant: Color(4283188300),
//       outline: Color(4286477437),
//       outlineVariant: Color(4291806157),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4281610036),
//       inversePrimary: Color(4293375728),
//       primaryFixed: Color(4294694911),
//       onPrimaryFixed: Color(4281272891),
//       primaryFixedDim: Color(4293375728),
//       onPrimaryFixedVariant: Color(4284430441),
//       secondaryFixed: Color(4294106099),
//       onSecondaryFixed: Color(4280555303),
//       secondaryFixedDim: Color(4292264150),
//       onSecondaryFixedVariant: Color(4283515220),
//       tertiaryFixed: Color(4294957782),
//       onTertiaryFixed: Color(4281536783),
//       tertiaryFixedDim: Color(4294293426),
//       onTertiaryFixedVariant: Color(4284889911),
//       surfaceDim: Color(4292990942),
//       surfaceBright: Color(4294965243),
//       surfaceContainerLowest: Color(4294967295),
//       surfaceContainerLow: Color(4294701560),
//       surfaceContainer: Color(4294306802),
//       surfaceContainerHigh: Color(4293977580),
//       surfaceContainerHighest: Color(4293583079),
//     );
//   }
//
//   ThemeData light() {
//     return theme(lightScheme());
//   }
//
//   static ColorScheme lightMediumContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.light,
//       primary: Color(4284101733),
//       surfaceTint: Color(4286074754),
//       onPrimary: Color(4294967295),
//       primaryContainer: Color(4287653274),
//       onPrimaryContainer: Color(4294967295),
//       secondary: Color(4283252304),
//       onSecondary: Color(4294967295),
//       secondaryContainer: Color(4286672771),
//       onSecondaryContainer: Color(4294967295),
//       tertiary: Color(4284626740),
//       onTertiary: Color(4294967295),
//       tertiaryContainer: Color(4288374627),
//       onTertiaryContainer: Color(4294967295),
//       error: Color(4287365129),
//       onError: Color(4294967295),
//       errorContainer: Color(4292490286),
//       onErrorContainer: Color(4294967295),
//       surface: Color(4294965243),
//       onSurface: Color(4280228383),
//       onSurfaceVariant: Color(4282925128),
//       outline: Color(4284832869),
//       outlineVariant: Color(4286675073),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4281610036),
//       inversePrimary: Color(4293375728),
//       primaryFixed: Color(4287653274),
//       onPrimaryFixed: Color(4294967295),
//       primaryFixedDim: Color(4285943168),
//       onPrimaryFixedVariant: Color(4294967295),
//       secondaryFixed: Color(4286672771),
//       onSecondaryFixed: Color(4294967295),
//       secondaryFixedDim: Color(4284962410),
//       onSecondaryFixedVariant: Color(4294967295),
//       tertiaryFixed: Color(4288374627),
//       onTertiaryFixed: Color(4294967295),
//       tertiaryFixedDim: Color(4286533451),
//       onTertiaryFixedVariant: Color(4294967295),
//       surfaceDim: Color(4292990942),
//       surfaceBright: Color(4294965243),
//       surfaceContainerLowest: Color(4294967295),
//       surfaceContainerLow: Color(4294701560),
//       surfaceContainer: Color(4294306802),
//       surfaceContainerHigh: Color(4293977580),
//       surfaceContainerHighest: Color(4293583079),
//     );
//   }
//
//   ThemeData lightMediumContrast() {
//     return theme(lightMediumContrastScheme());
//   }
//
//   static ColorScheme lightHighContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.light,
//       primary: Color(4281733698),
//       surfaceTint: Color(4286074754),
//       onPrimary: Color(4294967295),
//       primaryContainer: Color(4284101733),
//       onPrimaryContainer: Color(4294967295),
//       secondary: Color(4281015598),
//       onSecondary: Color(4294967295),
//       secondaryContainer: Color(4283252304),
//       onSecondaryContainer: Color(4294967295),
//       tertiary: Color(4282062613),
//       onTertiary: Color(4294967295),
//       tertiaryContainer: Color(4284626740),
//       onTertiaryContainer: Color(4294967295),
//       error: Color(4283301890),
//       onError: Color(4294967295),
//       errorContainer: Color(4287365129),
//       onErrorContainer: Color(4294967295),
//       surface: Color(4294965243),
//       onSurface: Color(4278190080),
//       onSurfaceVariant: Color(4280820265),
//       outline: Color(4282925128),
//       outlineVariant: Color(4282925128),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4281610036),
//       inversePrimary: Color(4294894847),
//       primaryFixed: Color(4284101733),
//       onPrimaryFixed: Color(4294967295),
//       primaryFixedDim: Color(4282522957),
//       onPrimaryFixedVariant: Color(4294967295),
//       secondaryFixed: Color(4283252304),
//       onSecondaryFixed: Color(4294967295),
//       secondaryFixedDim: Color(4281739321),
//       onSecondaryFixedVariant: Color(4294967295),
//       tertiaryFixed: Color(4284626740),
//       onTertiaryFixed: Color(4294967295),
//       tertiaryFixedDim: Color(4282917407),
//       onTertiaryFixedVariant: Color(4294967295),
//       surfaceDim: Color(4292990942),
//       surfaceBright: Color(4294965243),
//       surfaceContainerLowest: Color(4294967295),
//       surfaceContainerLow: Color(4294701560),
//       surfaceContainer: Color(4294306802),
//       surfaceContainerHigh: Color(4293977580),
//       surfaceContainerHighest: Color(4293583079),
//     );
//   }
//
//   ThemeData lightHighContrast() {
//     return theme(lightHighContrastScheme());
//   }
//
//   static ColorScheme darkScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(4293375728),
//       surfaceTint: Color(4293375728),
//       onPrimary: Color(4282786129),
//       primaryContainer: Color(4284430441),
//       onPrimaryContainer: Color(4294694911),
//       secondary: Color(4292264150),
//       onSecondary: Color(4282002237),
//       secondaryContainer: Color(4283515220),
//       onSecondaryContainer: Color(4294106099),
//       tertiary: Color(4294293426),
//       onTertiary: Color(4283180322),
//       tertiaryContainer: Color(4284889911),
//       onTertiaryContainer: Color(4294957782),
//       error: Color(4294948011),
//       onError: Color(4285071365),
//       errorContainer: Color(4287823882),
//       onErrorContainer: Color(4294957782),
//       surface: Color(4279636503),
//       onSurface: Color(4293583079),
//       onSurfaceVariant: Color(4291806157),
//       outline: Color(4288188055),
//       outlineVariant: Color(4283188300),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4293583079),
//       inversePrimary: Color(4286074754),
//       primaryFixed: Color(4294694911),
//       onPrimaryFixed: Color(4281272891),
//       primaryFixedDim: Color(4293375728),
//       onPrimaryFixedVariant: Color(4284430441),
//       secondaryFixed: Color(4294106099),
//       onSecondaryFixed: Color(4280555303),
//       secondaryFixedDim: Color(4292264150),
//       onSecondaryFixedVariant: Color(4283515220),
//       tertiaryFixed: Color(4294957782),
//       onTertiaryFixed: Color(4281536783),
//       tertiaryFixedDim: Color(4294293426),
//       onTertiaryFixedVariant: Color(4284889911),
//       surfaceDim: Color(4279636503),
//       surfaceBright: Color(4282201917),
//       surfaceContainerLowest: Color(4279307538),
//       surfaceContainerLow: Color(4280228383),
//       surfaceContainer: Color(4280491555),
//       surfaceContainerHigh: Color(4281215022),
//       surfaceContainerHighest: Color(4281938745),
//     );
//   }
//
//   ThemeData dark() {
//     return theme(darkScheme());
//   }
//
//   static ColorScheme darkMediumContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(4293638901),
//       surfaceTint: Color(4293375728),
//       onPrimary: Color(4280878133),
//       primaryContainer: Color(4289626552),
//       onPrimaryContainer: Color(4278190080),
//       secondary: Color(4292527323),
//       onSecondary: Color(4280160802),
//       secondaryContainer: Color(4288580512),
//       onSecondaryContainer: Color(4278190080),
//       tertiary: Color(4294622390),
//       onTertiary: Color(4281076746),
//       tertiaryContainer: Color(4290413438),
//       onTertiaryContainer: Color(4278190080),
//       error: Color(4294949553),
//       onError: Color(4281794561),
//       errorContainer: Color(4294923337),
//       onErrorContainer: Color(4278190080),
//       surface: Color(4279636503),
//       onSurface: Color(4294965754),
//       onSurfaceVariant: Color(4292069329),
//       outline: Color(4289437865),
//       outlineVariant: Color(4287266953),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4293583079),
//       inversePrimary: Color(4284496234),
//       primaryFixed: Color(4294694911),
//       onPrimaryFixed: Color(4280483887),
//       primaryFixedDim: Color(4293375728),
//       onPrimaryFixedVariant: Color(4283180887),
//       secondaryFixed: Color(4294106099),
//       onSecondaryFixed: Color(4279831580),
//       secondaryFixedDim: Color(4292264150),
//       onSecondaryFixedVariant: Color(4282396995),
//       tertiaryFixed: Color(4294957782),
//       onTertiaryFixed: Color(4280616710),
//       tertiaryFixedDim: Color(4294293426),
//       onTertiaryFixedVariant: Color(4283640616),
//       surfaceDim: Color(4279636503),
//       surfaceBright: Color(4282201917),
//       surfaceContainerLowest: Color(4279307538),
//       surfaceContainerLow: Color(4280228383),
//       surfaceContainer: Color(4280491555),
//       surfaceContainerHigh: Color(4281215022),
//       surfaceContainerHighest: Color(4281938745),
//     );
//   }
//
//   ThemeData darkMediumContrast() {
//     return theme(darkMediumContrastScheme());
//   }
//
//   static ColorScheme darkHighContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(4294965754),
//       surfaceTint: Color(4293375728),
//       onPrimary: Color(4278190080),
//       primaryContainer: Color(4293638901),
//       onPrimaryContainer: Color(4278190080),
//       secondary: Color(4294965754),
//       onSecondary: Color(4278190080),
//       secondaryContainer: Color(4292527323),
//       onSecondaryContainer: Color(4278190080),
//       tertiary: Color(4294965753),
//       onTertiary: Color(4278190080),
//       tertiaryContainer: Color(4294622390),
//       onTertiaryContainer: Color(4278190080),
//       error: Color(4294965753),
//       onError: Color(4278190080),
//       errorContainer: Color(4294949553),
//       onErrorContainer: Color(4278190080),
//       surface: Color(4279636503),
//       onSurface: Color(4294967295),
//       onSurfaceVariant: Color(4294965754),
//       outline: Color(4292069329),
//       outlineVariant: Color(4292069329),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4293583079),
//       inversePrimary: Color(4282325578),
//       primaryFixed: Color(4294761983),
//       onPrimaryFixed: Color(4278190080),
//       primaryFixedDim: Color(4293638901),
//       onPrimaryFixedVariant: Color(4280878133),
//       secondaryFixed: Color(4294435063),
//       onSecondaryFixed: Color(4278190080),
//       secondaryFixedDim: Color(4292527323),
//       onSecondaryFixedVariant: Color(4280160802),
//       tertiaryFixed: Color(4294959325),
//       onTertiaryFixed: Color(4278190080),
//       tertiaryFixedDim: Color(4294622390),
//       onTertiaryFixedVariant: Color(4281076746),
//       surfaceDim: Color(4279636503),
//       surfaceBright: Color(4282201917),
//       surfaceContainerLowest: Color(4279307538),
//       surfaceContainerLow: Color(4280228383),
//       surfaceContainer: Color(4280491555),
//       surfaceContainerHigh: Color(4281215022),
//       surfaceContainerHighest: Color(4281938745),
//     );
//   }
//
//   ThemeData darkHighContrast() {
//     return theme(darkHighContrastScheme());
//   }
//
//
//   ThemeData theme(ColorScheme colorScheme) => ThemeData(
//      useMaterial3: true,
//      brightness: colorScheme.brightness,
//      colorScheme: colorScheme,
//      textTheme: textTheme.apply(
//        bodyColor: colorScheme.onSurface,
//        displayColor: colorScheme.onSurface,
//      ),
//      scaffoldBackgroundColor: colorScheme.background,
//      canvasColor: colorScheme.surface,
//   );
//
//
//   List<ExtendedColor> get extendedColors => [
//   ];
// }
//
// class ExtendedColor {
//   final Color seed, value;
//   final ColorFamily light;
//   final ColorFamily lightHighContrast;
//   final ColorFamily lightMediumContrast;
//   final ColorFamily dark;
//   final ColorFamily darkHighContrast;
//   final ColorFamily darkMediumContrast;
//
//   const ExtendedColor({
//     required this.seed,
//     required this.value,
//     required this.light,
//     required this.lightHighContrast,
//     required this.lightMediumContrast,
//     required this.dark,
//     required this.darkHighContrast,
//     required this.darkMediumContrast,
//   });
// }
//
// class ColorFamily {
//   const ColorFamily({
//     required this.color,
//     required this.onColor,
//     required this.colorContainer,
//     required this.onColorContainer,
//   });
//
//   final Color color;
//   final Color onColor;
//   final Color colorContainer;
//   final Color onColorContainer;
// }

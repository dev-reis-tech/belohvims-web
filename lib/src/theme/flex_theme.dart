// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// final FlexSchemeColor schemeLight = FlexSchemeColor.from(
//   primary: const Color(0xFF00296B),
//   secondary: const Color(0xFFFF7B00),
//   brightness: Brightness.light,
// );

// final FlexSchemeColor schemeDark = FlexSchemeColor.from(
//   primary: const Color(0xFF6B8BC3),
//   secondary: const Color(0xffff7155),
//   brightness: Brightness.dark,
// );

// const FlexScheme scheme = FlexScheme.flutterDash;

// const bool useScheme = true;

// const double appBarElevation = 0.5;

// const double appBarOpacity = 0.94;

// const bool computeDarkTheme = false;

// const int toDarkLevel = 30;

// const bool swapColors = false;

// const int usedColors = 6;

// const FlexKeyColors keyColors = FlexKeyColors(
//   useKeyColors: false,
//   useSecondary: true,
//   useTertiary: true,
//   keepPrimary: true,
//   keepPrimaryContainer: false,
//   keepSecondary: false,
//   keepSecondaryContainer: false,
//   keepTertiary: false,
//   keepTertiaryContainer: false,
// );

// final FlexTones flexTonesLight = FlexTones.material(Brightness.light);
// final FlexTones flexTonesDark = FlexTones.material(Brightness.dark);

// final String? fontFamily = GoogleFonts.notoSans().fontFamily;

// const TextTheme textTheme = TextTheme(
//   displayMedium: TextStyle(fontSize: 41),
//   displaySmall: TextStyle(fontSize: 36),
//   labelSmall: TextStyle(fontSize: 11, letterSpacing: 0.5),
// );

// const FlexSurfaceMode surfaceMode = FlexSurfaceMode.highBackgroundLowScaffold;

// const int blendLevel = 8;

// const bool useSubThemes = true;

// const FlexSubThemesData subThemesData = FlexSubThemesData(
//   interactionEffects: true,
//   defaultRadius: null,
//   bottomSheetRadius: 24,
//   useMaterial3Typography: true,
//   inputDecoratorBorderType: FlexInputBorderType.outline,
//   inputDecoratorIsFilled: true,
//   inputDecoratorUnfocusedHasBorder: false,
//   inputDecoratorSchemeColor: SchemeColor.primary,
//   inputDecoratorBackgroundAlpha: 20,
//   chipSchemeColor: SchemeColor.surfaceContainerHighest,
//   chipSelectedSchemeColor: SchemeColor.tertiaryContainer,
//   chipSecondarySelectedSchemeColor: SchemeColor.primaryContainer,
//   chipBlendColors: false,
//   elevatedButtonElevation: 1,
//   thickBorderWidth: 1.5,
//   thinBorderWidth: 1,
//   bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
//   bottomNavigationBarBackgroundSchemeColor: SchemeColor.surfaceContainer,
// );

// const bool transparentStatusBar = true;

// const FlexTabBarStyle tabBarForAppBar = FlexTabBarStyle.forAppBar;

// const bool tooltipsMatchBackground = true;

// final VisualDensity visualDensity = FlexColorScheme.comfortablePlatformDensity;

// final TargetPlatform platform = defaultTargetPlatform;

// class BrandTheme extends ThemeExtension<BrandTheme> {
//   const BrandTheme({
//     this.brandColor,
//   });
//   final Color? brandColor;

//   @override
//   BrandTheme copyWith({
//     Color? brandColor,
//   }) =>
//       BrandTheme(
//         brandColor: brandColor ?? this.brandColor,
//       );

//   @override
//   BrandTheme lerp(ThemeExtension<BrandTheme>? other, double t) {
//     if (other is! BrandTheme) {
//       return this;
//     }
//     return BrandTheme(
//       brandColor: Color.lerp(brandColor, other.brandColor, t),
//     );
//   }
// }

// const BrandTheme lightBrandTheme = BrandTheme(
//   brandColor: Color.fromARGB(255, 8, 79, 71),
// );

// const BrandTheme darkBrandTheme = BrandTheme(
//   brandColor: Color.fromARGB(255, 167, 227, 218),
// );

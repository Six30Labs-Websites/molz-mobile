import 'package:google_fonts/google_fonts.dart';
import 'package:molz/src/utils/custom_colors.dart';
import 'package:molz/src/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: option1Color,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    // iconTheme: const IconThemeData(color: kContentColorLightTheme),
    iconTheme: const IconThemeData(color: option3Color),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: option1Color, fontFamily: fontInter),
    colorScheme: const ColorScheme.light(
      primary: option1Color,
      secondary: option3Color,
      error: redColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: option1Color.withOpacity(0.7),
      unselectedItemColor: blackColor.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: option1Color),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // By default flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: whiteColor,
    // scaffoldBackgroundColor: kContentColorLightTheme,
    scaffoldBackgroundColor: option1Color,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: option3Color),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: option3Color, fontFamily: fontInter),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: option1Color,
      secondary: option2Color,
      error: redColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: option1Color,
      selectedItemColor: whiteColor,
      unselectedItemColor: blackColor.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: option1Color),
      showUnselectedLabels: true,
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

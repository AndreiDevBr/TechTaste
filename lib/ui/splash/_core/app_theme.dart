import 'package:flutter/material.dart';
import 'package:flutter_techtaste/ui/splash/_core/app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
        )),
        foregroundColor: WidgetStateProperty.all(Colors.black),
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          } else if (states.contains(WidgetState.pressed)) {
            return const Color.fromARGB(127, 255, 164, 89);
          }
          return AppColors.mainColor;
        }),
      ),
    ),
  );
}

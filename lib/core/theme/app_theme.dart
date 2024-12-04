import 'package:flutter/material.dart';
import 'package:prestamo_lite/core/theme/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final themeMode = ThemeData().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundPrimary,
    iconTheme: IconThemeData(),
    appBarTheme: AppBarTheme(backgroundColor: AppPalette.backgroundSecondary),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.borderFocusedColor),
      errorBorder: _border(Colors.red),
      focusedErrorBorder: _border(Colors.red),
    ),
  );
}

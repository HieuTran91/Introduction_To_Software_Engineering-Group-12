import 'package:flutter/material.dart';
import 'dart:ui';

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: Colors.black45,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Colors.black87,
          fontSize: 12,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 24,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      );
}

class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFF9B401),
    primaryContainer: Color(0XFF333333),
    secondaryContainer: Color(0X7FF9B401),

    // Error colors
    errorContainer: Color(0X87000000),
    onError: Color(0X267A89EC),

    // On colors(text colors)
    onPrimary: Color(0XFF171A1F),
    onPrimaryContainer: Color(0XB2FFFFFF),
  );
}

class PrimaryColors {
  // Amber
  Color get amber500 => Color(0XFFFFC107);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);

  // Gray
  Color get gray100 => Color(0XFFF5F6FA);
  Color get gray10001 => Color(0XFFF2F2F2);
  Color get gray400 => Color(0XFFC4C4C4);
  Color get gray40001 => Color(0XFFB9B9B9);
  Color get gray600 => Color(0XFF828282);

  // Green
  Color get green900 => Color(0XFF008000);

  // Indigo
  Color get indigoA40019 => Color(0X194844E5);

  // Red
  Color get redA200 => Color(0XFFFF5D5D);
}

import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomTextStyles {
  // Body text style
  static get bodyMediumGray40001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray40001,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get bodyMediumRubikOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.rubik.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get bodyMediumRubikPrimaryContainer =>
      theme.textTheme.bodyMedium!.rubik.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  // Headline text style
  static get headlineSmallArchivoBlack =>
      theme.textTheme.headlineSmall!.archivoBlack.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallGray400 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallInter =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallInterErrorContainer =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargeErrorContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get titleLargeErrorContainer_1 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
      );
  static get titleLargeGray400 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeMedium => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleLargePrimaryMedium => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumErrorContainer => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
      );
  static get titleMediumErrorContainerMedium =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(0.4),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray400,
      );
  static get titleMediumInterErrorContainer =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterErrorContainerSemiBold =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(0.6),
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumLatoErrorContainer =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumRubik => theme.textTheme.titleMedium!.rubik.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumRubikPrimaryContainer =>
      theme.textTheme.titleMedium!.rubik.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallErrorContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallErrorContainerBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(0.2),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallErrorContainerBold15 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallGray400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallGray400_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
      );
  static get titleSmallGray400_2 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get archivoBlack {
    return copyWith(
      fontFamily: 'Archivo Black',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get rubik {
    return copyWith(
      fontFamily: 'Rubik',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}

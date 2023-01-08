import 'package:adi_quiz/app/config/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle buttonFullColor = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.all(15),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      AppColors.primary,
    ),
    overlayColor: MaterialStateProperty.all<Color>(
      AppColors.overlayWhite,
    ),
    foregroundColor: MaterialStateProperty.all<Color>(
      Colors.white,
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          25.0,
        ),
        side: const BorderSide(
          color: AppColors.primary,
        ),
      ),
    ),
  );

  static ButtonStyle buttonBorder = buttonFullColor.copyWith(
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.transparent,
    ),
    foregroundColor: MaterialStateProperty.all<Color>(
      AppColors.primary,
    ),
  );
}

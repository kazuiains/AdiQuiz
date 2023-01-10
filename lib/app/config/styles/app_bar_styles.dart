import 'package:adi_quiz/app/config/app_colors.dart';
import 'package:adi_quiz/presentation/ui/widgets/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_styles.dart';

class AppBarStyles {
  static normalAppbar({
    String? title,
    List<Widget>? action,
  }) {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        title ?? "",
        style: TextStyles.labelWhite,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left,
          size: 36,
        ),
        onPressed: () => Get.back(),
        color: Colors.white,
      ),
      centerTitle: true,
      shadowColor: Colors.grey.withOpacity(0),
      backgroundColor: AppColors.bodyColor,
      elevation: 0,
      actions: action,
    );
  }

  static quizAppbar({
    String? title,
    required VoidCallback onPressed,
  }) {
    return normalAppbar(
      title: title,
      action: [
        BaseView.buildExitButton(onPressed: onPressed),
      ],
    );
  }
}

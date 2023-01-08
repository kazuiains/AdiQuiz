import 'package:adi_quiz/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BaseLoadingView {
  static init() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = AppColors.primary
      ..backgroundColor = Colors.white
      ..indicatorColor = AppColors.primary
      ..textColor = AppColors.text
      ..maskColor = Colors.white.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..maskType = EasyLoadingMaskType.black;
  }

  static show({
    String? text,
  }) async {
    await EasyLoading.show(
      status: text,
    );
  }

  static dismiss() async {
    await EasyLoading.dismiss();
  }
}

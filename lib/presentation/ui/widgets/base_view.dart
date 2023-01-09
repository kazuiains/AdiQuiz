import 'package:adi_quiz/app/config/app_dimens.dart';
import 'package:flutter/material.dart';

class BaseView {
  static buildContentView({
    required List<Widget> children,
    GestureTapCallback? onTap,
    Color? color,
  }) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppDimens.roundedMedium,
        ),
      ),
      child: Card(
        color: color ?? Colors.white,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimens.roundedMedium,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(
              AppDimens.paddingAppBody,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

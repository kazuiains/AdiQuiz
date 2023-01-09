import 'package:adi_quiz/app/config/app_colors.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/app_styles.dart';
import 'package:adi_quiz/presentation/ui/widgets/base_view.dart';
import 'package:flutter/material.dart';

class TopicItemListView extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;

  const TopicItemListView({
    Key? key,
    this.data,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItem(context);
  }

  _buildItem(BuildContext context) {
    String title = AppStrings.defaultNullValue;
    if (data != null) {
      data as String;
      title = data;
    }

    return BaseView.buildContentView(
      onTap: onTap,
      color: AppColors.itemListColor,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.labelSemiGray,
            ),
            Icon(
              Icons.arrow_right_outlined,
              color: AppColors.semiGrayColor,
            )
          ],
        )
      ],
    );
  }
}

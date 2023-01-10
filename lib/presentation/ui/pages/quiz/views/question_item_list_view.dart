import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/app_styles.dart';
import 'package:adi_quiz/presentation/ui/widgets/base_view.dart';
import 'package:flutter/material.dart';

class QuestionItemListView extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final Color color;

  const QuestionItemListView({
    Key? key,
    this.data,
    this.onTap,
    required this.color,
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
      color: color,
      radius: 25,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyles.labelBlack,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/app_styles.dart';
import 'package:adi_quiz/app/config/constants/assets_constants.dart';
import 'package:adi_quiz/domain/entities/question.dart';
import 'package:flutter/material.dart';

class ResultItemListView extends StatelessWidget {
  final Question? question;
  final String? yourAnswer;
  final GestureTapCallback? onTap;
  final Color color;

  const ResultItemListView({
    Key? key,
    this.question,
    this.yourAnswer,
    this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildItem(context);
  }

  _buildItem(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              question?.text ?? AppStrings.defaultNullValue,
              style: TextStyles.labelWhite,
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            children: [
              if (yourAnswer != null &&
                  question != null &&
                  yourAnswer != question!.answerKey) ...{
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsConstants.iconCrossed,
                        fit: BoxFit.fill,
                        width: 14,
                        height: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(
                          yourAnswer ?? AppStrings.defaultNullValue,
                          style: TextStyles.labelWhite.copyWith(fontSize: 11),
                        ),
                      )
                    ],
                  ),
                ),
              },
              Row(
                children: [
                  Image.asset(
                    AssetsConstants.iconCheck,
                    fit: BoxFit.fill,
                    width: 15,
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      question?.answerKey ?? AppStrings.defaultNullValue,
                      style: TextStyles.labelWhite.copyWith(fontSize: 11),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

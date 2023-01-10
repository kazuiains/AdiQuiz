import 'package:adi_quiz/app/config/app_dimens.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/styles/app_bar_styles.dart';
import 'package:adi_quiz/app/config/styles/button_styles.dart';
import 'package:adi_quiz/app/config/styles/text_styles.dart';
import 'package:adi_quiz/presentation/get/controllers/result/result_controller.dart';
import 'package:adi_quiz/presentation/ui/pages/result/views/result_item_list_view.dart';
import 'package:adi_quiz/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ResultPage extends GetView<ResultController> {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarStyles.normalAppbar(
          title: AppStrings.titleResult,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppDimens.paddingAppBody),
            alignment: Alignment.center,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SimpleCircularProgressBar(
                  valueNotifier: ValueNotifier(controller.correctAnswer),
                  maxValue: controller.maxQuestion,
                  mergeMode: true,
                  onGetText: (double value) {
                    return Text(
                      '${value.toInt()} / ${controller.maxQuestion.toInt()}',
                      style: TextStyles.labelWhite.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Space.vLarge,
                TextButton(
                  style: ButtonStyles.buttonFullColorSquareRounded,
                  onPressed: () => controller.onShare(),
                  child: Text(
                    AppStrings.shareScore,
                    style: TextStyles.labelSmall,
                  ),
                ),
                Space.vMedium,
                Text(
                  AppStrings.yourReport,
                  style: TextStyles.labelHeader.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Space.vMedium,
                ListView.separated(
                  padding: const EdgeInsets.only(
                    top: AppDimens.paddingAppBody,
                    bottom: AppDimens.paddingAppBody,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  separatorBuilder: (_, __) => Space.vMedium,
                  itemBuilder: (context, index) {
                    var question = controller.listData[index];
                    var answer = controller.listSelected[index];
                    return ResultItemListView(
                      question: question,
                      yourAnswer: answer,
                      color: Colors.white,
                    );
                  },
                  itemCount: controller.listData.length,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

import 'package:adi_quiz/app/config/app_dimens.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/app_styles.dart';
import 'package:adi_quiz/presentation/get/controllers/quiz/quiz_controller.dart';
import 'package:adi_quiz/presentation/ui/pages/quiz/views/question_item_list_view.dart';
import 'package:adi_quiz/presentation/ui/widgets/base_view.dart';
import 'package:adi_quiz/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizPage extends GetView<QuizController> {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        String answer = controller.currentQuestion.answerKey ?? "";
        String itemSelected = controller.selected;
        return Scaffold(
          appBar: AppBarStyles.quizAppbar(
            title: AppStrings.titleQuiz,
            onPressed: () => controller.goToHome(),
            value: controller.durationProgress,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppDimens.paddingAppBody),
                  child: BaseView.buildContentView(
                    color: Colors.white,
                    children: [
                      Text(
                        controller.currentQuestion.text ??
                            AppStrings.defaultNullValue,
                        style: TextStyles.labelHeaderQuiz,
                        textAlign: TextAlign.center,
                      ),
                      if (controller.currentQuestion.image != null &&
                          controller.currentQuestion.image!.isNotEmpty) ...{
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppDimens.paddingAppBodySmall,
                          ),
                          child: Image.network(
                            controller.currentQuestion.image!,
                            width: double.infinity,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                        )
                      },
                    ],
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimens.paddingAppBody,
                    AppDimens.paddingAppBody,
                    AppDimens.paddingAppBody,
                    AppDimens.paddingAppBody,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  separatorBuilder: (_, __) => Space.vMedium,
                  itemBuilder: (context, index) {
                    var data = controller.currentOptions[index];
                    return QuestionItemListView(
                      data: data,
                      color: controller.onBackgroundColor(
                        data: data,
                        answer: answer,
                        itemSelected: itemSelected,
                      ),
                      onTap: () => controller.onSelect(
                        data: data,
                      ),
                    );
                  },
                  itemCount: controller.currentOptions.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

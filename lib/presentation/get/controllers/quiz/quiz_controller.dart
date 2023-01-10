import 'dart:async';

import 'package:adi_quiz/app/config/app_colors.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/routes/app_routes.dart';
import 'package:adi_quiz/app/config/routes/arguments/base/base_page_arguments.dart';
import 'package:adi_quiz/domain/entities/question.dart';
import 'package:adi_quiz/domain/usecases/list_question_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  QuizController({
    required this.listUseCase,
  });

  final ListQuestionUseCase listUseCase;

  final _listData = <Question>[].obs;
  final _currentOptions = <String>[].obs;
  final _listSelected = <String>[].obs;

  final _currentQuestion = Question().obs;

  final _currentIndex = 0.obs;
  final _selected = "".obs;

  Timer? _answerDuration;
  Timer? _correctingDuration;
  int remainingSeconds = 1;
  final _correcting = false.obs;
  final _durationProgress = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    getList();
  }

  @override
  void onClose() {
    super.onClose();
    _answerDuration?.cancel();
    _correctingDuration?.cancel();
  }

  getList({
    String? topic,
  }) async {
    var response = await listUseCase.execute("topic1");
    _listData.addAll(response);
    _setQuestion();
  }

  _setQuestion() {
    _selected.value = "";
    _currentQuestion.value = listData[currentIndex];
    _setOptionList();
    _startAnswerDuration(30);
  }

  _setOptionList() {
    List<String> options = [];
    options.add(currentQuestion.option1 ?? AppStrings.defaultNullValue);
    options.add(currentQuestion.option2 ?? AppStrings.defaultNullValue);
    options.add(currentQuestion.option3 ?? AppStrings.defaultNullValue);
    options.add(currentQuestion.option4 ?? AppStrings.defaultNullValue);
    _currentOptions.value = options;
    _correcting.value = false;
  }

  _startAnswerDuration(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _durationProgress.value = 0;
    _answerDuration?.cancel();

    _answerDuration = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        _nextAndSubmitQuestion();
      } else {
        _durationProgress.value += 0.0333333333333333;
        remainingSeconds--;
      }
    });
  }

  _nextAndSubmitQuestion({
    String? data,
  }) {
    _answerDuration?.cancel();
    _correcting.value = true;

    _currentIndex.value = currentIndex + 1;
    _selected.value = data ?? "";
    _listSelected.add(data ?? AppStrings.defaultNullValue);

    if (currentIndex < listData.length) {
      _answerCorrection(isFinish: false);
    } else {
      _answerCorrection(isFinish: true);
    }
  }

  _answerCorrection({
    required bool isFinish,
  }) {
    const duration = Duration(seconds: 1);
    int remaining = 1;

    _correctingDuration = Timer.periodic(duration, (Timer timer) {
      if (remaining == 0) {
        timer.cancel();

        if (isFinish) {
          _goToResult();
        } else {
          _setQuestion();
        }
      } else {
        remaining--;
      }
    });
  }

  goToHome() {
    Get.offAllNamed(
      AppRoutes.home,
    );
  }

  _goToResult() {
    double score = 0;
    for (var i = 0; i < listData.length; i++) {
      if (listData[i].answerKey == listSelected[i]) {
        score = score + 1;
      }
    }

    Get.offNamed(
      AppRoutes.result,
      arguments: BasePageArguments<List<Question>, List<String>>(
        data: listData,
        answer: listSelected,
        score: score,
      ),
    );
  }

  onSelect({
    String? data,
  }) {
    if (data != null && !correcting) {
      _nextAndSubmitQuestion(data: data);
    }
  }

  onBackgroundColor({
    String? data,
    String? answer,
    String? itemSelected,
  }) {
    if (data != null &&
        data.isNotEmpty &&
        answer != null &&
        answer.isNotEmpty &&
        itemSelected != null &&
        itemSelected.isNotEmpty) {
      if ((answer == data && itemSelected == data) || answer == data) {
        return AppColors.correctColor;
      } else if (answer != data && itemSelected == data) {
        return AppColors.wrongColor;
      }
    }
    return Colors.white;
  }

  List<Question> get listData => _listData;

  List<String> get currentOptions => _currentOptions;

  List<String> get listSelected => _listSelected;

  Question get currentQuestion => _currentQuestion.value;

  int get currentIndex => _currentIndex.value;

  String get selected => _selected.value;

  bool get correcting => _correcting.value;

  double get durationProgress => _durationProgress.value;
}

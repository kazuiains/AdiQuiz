import 'package:adi_quiz/app/config/app_colors.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/routes/app_routes.dart';
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

  @override
  void onReady() {
    super.onReady();
    getList();
  }

  getList({
    String? topic,
  }) async {
    var response = await listUseCase.execute("topic1");
    _listData.addAll(response);
    _setQuestion();
  }

  _setQuestion() {
    _currentQuestion.value = listData[currentIndex];
    _setOptionList();
  }

  _setOptionList() {
    List<String> options = [];
    options.add(currentQuestion.option1 ?? AppStrings.defaultNullValue);
    options.add(currentQuestion.option2 ?? AppStrings.defaultNullValue);
    options.add(currentQuestion.option3 ?? AppStrings.defaultNullValue);
    options.add(currentQuestion.option4 ?? AppStrings.defaultNullValue);
    _currentOptions.value = options;
  }

  goToHome() {
    Get.offAllNamed(
      AppRoutes.home,
    );
  }

  onSelect({
    String? data,
  }) {
    if (data != null) {
      _currentIndex.value = currentIndex + 1;
      _selected.value = data;
      _listSelected.add(data);
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
}

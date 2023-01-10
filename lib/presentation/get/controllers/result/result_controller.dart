import 'package:adi_quiz/app/config/routes/arguments/base/base_page_arguments.dart';
import 'package:adi_quiz/domain/entities/question.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final _arguments = BasePageArguments<List<Question>, List<String>>().obs;

  final _listData = <Question>[].obs;
  final _listSelected = <String>[].obs;
  final _correctAnswer = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _initDataFromArguments();
  }

  _initDataFromArguments() {
    _arguments.value = Get.arguments;
    _listSelected.value = _arguments.value.answer ?? [];
    _listData.value = _arguments.value.data ?? [];
    _correctAnswer.value = _arguments.value.score ?? 0;
  }

  onShare() {}

  List<Question> get listData => _listData;

  List<String> get listSelected => _listSelected;

  double get maxQuestion => listData.length.toDouble();

  double get correctAnswer => _correctAnswer.value;
}

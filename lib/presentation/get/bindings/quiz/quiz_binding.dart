import 'package:adi_quiz/presentation/get/controllers/quiz/quiz_controller.dart';
import 'package:get/get.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    _dependencyCreator();
    _useCasePage();

    Get.put(QuizController());
  }

  _dependencyCreator() {}

  _useCasePage() {}
}

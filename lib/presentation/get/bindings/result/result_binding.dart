import 'package:adi_quiz/presentation/get/controllers/result/result_controller.dart';
import 'package:get/get.dart';

class ResultBinding extends Bindings {
  @override
  void dependencies() {
    _dependencyCreator();
    _useCasePage();

    Get.put(ResultController());
  }

  _dependencyCreator() {}

  _useCasePage() {}
}

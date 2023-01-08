import 'package:adi_quiz/presentation/get/controllers/topic/topic_controller.dart';
import 'package:get/get.dart';

class TopicBinding extends Bindings {
  @override
  void dependencies() {
    _dependencyCreator();
    _useCasePage();

    Get.put(TopicController());
  }

  _dependencyCreator() {}

  _useCasePage() {}
}

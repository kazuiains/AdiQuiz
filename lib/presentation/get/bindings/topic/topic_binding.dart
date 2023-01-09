import 'package:adi_quiz/data/repositories/topic_repository_impl.dart';
import 'package:adi_quiz/domain/usecases/list_topic_use_case.dart';
import 'package:adi_quiz/presentation/get/controllers/topic/topic_controller.dart';
import 'package:get/get.dart';

class TopicBinding extends Bindings {
  @override
  void dependencies() {
    _dependencyCreator();
    _useCasePage();

    Get.put(TopicController(listUseCase: Get.find<ListTopicUseCase>()));
  }

  _dependencyCreator() {
    Get.lazyPut(() => TopicRepositoryImpl());
  }

  _useCasePage() {
    Get.lazyPut(
      () => ListTopicUseCase(
        Get.find<TopicRepositoryImpl>(),
      ),
    );
  }
}

import 'package:adi_quiz/data/repositories/quiz_repository_impl.dart';
import 'package:adi_quiz/data/repositories/topic_repository_impl.dart';
import 'package:adi_quiz/domain/usecases/list_question_use_case.dart';
import 'package:adi_quiz/presentation/get/controllers/quiz/quiz_controller.dart';
import 'package:get/get.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    _dependencyCreator();
    _useCasePage();

    Get.put(QuizController(
      listUseCase: Get.find<ListQuestionUseCase>(),
    ));
  }

  _dependencyCreator() {
    Get.lazyPut(() => QuizRepositoryImpl());
    Get.lazyPut(() => TopicRepositoryImpl());
  }

  _useCasePage() {
    Get.lazyPut(
      () => ListQuestionUseCase(
        repo: Get.find<QuizRepositoryImpl>(),
        topicRepo: Get.find<TopicRepositoryImpl>(),
      ),
    );
  }
}

import 'package:adi_quiz/app/config/routes/app_routes.dart';
import 'package:adi_quiz/app/config/routes/arguments/base/base_page_arguments.dart';
import 'package:adi_quiz/domain/entities/topic.dart';
import 'package:adi_quiz/domain/usecases/list_topic_use_case.dart';
import 'package:get/get.dart';

class TopicController extends GetxController {
  TopicController({
    required this.listUseCase,
  });

  final ListTopicUseCase listUseCase;

  final _listData = <Topic>[].obs;

  final _isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    getList();
  }

  getList() async {
    var response = await listUseCase.execute();
    _listData.addAll(response);
    _isLoading.value = false;
  }

  goToPlay({
    String? data,
  }) {
    if (data != null) {
      Get.toNamed(
        AppRoutes.quiz,
        arguments: BasePageArguments(
          isSelectedTopic: true,
          topicId: data,
        ),
      );
    }
  }

  List<Topic> get listData => _listData;

  bool get isLoading => _isLoading.value;
}

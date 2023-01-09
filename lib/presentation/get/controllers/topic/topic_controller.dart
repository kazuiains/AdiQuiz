import 'package:adi_quiz/app/config/routes/app_routes.dart';
import 'package:adi_quiz/domain/entities/topic.dart';
import 'package:adi_quiz/domain/usecases/list_topic_use_case.dart';
import 'package:get/get.dart';

class TopicController extends GetxController {
  TopicController({
    required this.listUseCase,
  });

  final ListTopicUseCase listUseCase;

  final _listData = <Topic>[].obs;

  @override
  void onReady() {
    super.onReady();
    getList();
  }

  getList() async {
    var response = await listUseCase.execute();
    _listData.addAll(response);
  }

  goToPlay({
    String? data,
  }) {
    if (data != null) {
      Get.toNamed(
        AppRoutes.quiz,
      );
    }
  }

  List<Topic> get listData => _listData;
}

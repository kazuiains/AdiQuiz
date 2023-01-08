import 'package:adi_quiz/presentation/get/controllers/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    _dependencyCreator();
    _useCasePage();

    Get.put(HomeController());
  }

  _dependencyCreator() {}

  _useCasePage() {}
}

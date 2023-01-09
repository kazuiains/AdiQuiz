import 'package:adi_quiz/app/config/constants/preference_constants.dart';
import 'package:adi_quiz/app/services/local_storage.dart';
import 'package:get/get.dart';

class SettingHelper {
  static final localStorage = Get.find<LocalStorage>();

  static String? getTopic() {
    return localStorage.getStringValue(key: quizTopic);
  }

  static saveTopic(String? topic) {
    localStorage.saveStringValue(
      key: quizTopic,
      value: topic,
    );
  }
}

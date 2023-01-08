import 'package:adi_quiz/app/config/app_config.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends GetxController {
  goToPlay() {
    Get.toNamed(
      AppRoutes.quiz,
    );
  }

  goToTopic() {
    Get.toNamed(
      AppRoutes.topic,
    );
  }

  onShare() {
    Share.share("${AppStrings.downloadApkDescription}${AppConfig.instance?.downloadUrl}");
  }

  onReview() {}
}

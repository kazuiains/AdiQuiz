import 'package:adi_quiz/app/config/app_config.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/constants/link_page_constants.dart';
import 'package:adi_quiz/app/config/routes/app_routes.dart';
import 'package:adi_quiz/app/config/routes/arguments/base/base_page_arguments.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  goToPlay() {
    Get.toNamed(
      AppRoutes.quiz,
      arguments: BasePageArguments(
        isSelectedTopic: false,
      ),
    );
  }

  goToTopic() {
    Get.toNamed(
      AppRoutes.topic,
    );
  }

  onShare() {
    Share.share(
        "${AppStrings.downloadApkDescription}${AppConfig.instance?.downloadUrl}");
  }

  onReview() async {
    await launchUrl(
      Uri.parse(reviewUrl),
      mode: LaunchMode.externalApplication,
    );
  }
}

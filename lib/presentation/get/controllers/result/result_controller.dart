import 'dart:typed_data';

import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/routes/arguments/base/base_page_arguments.dart';
import 'package:adi_quiz/app/types/snack_bar_type.dart';
import 'package:adi_quiz/domain/entities/question.dart';
import 'package:adi_quiz/presentation/ui/widgets/base_loading_view.dart';
import 'package:adi_quiz/presentation/ui/widgets/base_snack_bar_view.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ResultController extends GetxController {
  final _arguments = BasePageArguments<List<Question>, List<String>>().obs;

  final _listData = <Question>[].obs;
  final _listSelected = <String>[].obs;
  final _correctAnswer = 0.0.obs;

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void onInit() {
    super.onInit();
    _initDataFromArguments();
  }

  _initDataFromArguments() {
    _arguments.value = Get.arguments;
    _listSelected.value = _arguments.value.answer ?? [];
    _listData.value = _arguments.value.data ?? [];
    _correctAnswer.value = _arguments.value.score ?? 0;
  }

  onShare() {
    BaseLoadingView.show();
    screenshotController.capture().then(
      (Uint8List? image) async {
        final directory = (await getApplicationDocumentsDirectory()).path;
        String fileName = AppStrings.filename;

        String? path = await screenshotController.captureAndSave(
          directory,
          fileName: fileName,
        );

        BaseLoadingView.dismiss();
        if (path != null) {
          Share.shareXFiles(
            [XFile(path)],
            text: AppStrings.descriptionShareResult,
          );
        } else {
          BaseSnackBarView.snackBar(
            message: AppStrings.errorMessageSystemError,
            snackBarType: SnackBarType.error,
          );
        }
      },
    ).catchError(
      (onError) {
        BaseLoadingView.dismiss();
        BaseSnackBarView.snackBar(
          message: AppStrings.errorMessageSystemError,
          snackBarType: SnackBarType.error,
        );
      },
    );
  }

  List<Question> get listData => _listData;

  List<String> get listSelected => _listSelected;

  double get maxQuestion => listData.length.toDouble();

  double get correctAnswer => _correctAnswer.value;
}
